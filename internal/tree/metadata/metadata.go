package metadata

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

type Metadata struct {
	Filepath string
	Content  string
	Data     map[string]string
}

func New(path string) (*Metadata, error) {
	file, err := os.Open(path)
	if err != nil {
		err = fmt.Errorf("error opening metadata file: %v", err)
		return nil, err
	}
	defer file.Close()

	meta := &Metadata{
		Filepath: path,
		Content:  "",
		Data:     make(map[string]string),
	}

	var builder strings.Builder
	inHeader := true
	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		text := scanner.Text()
		if inHeader {
			line := strings.TrimSpace(text)
			if !strings.HasPrefix(line, "--") {
				builder.WriteString(fmt.Sprintf("%s\n", text))
				inHeader = false
				continue
			}

			content := strings.TrimSpace(strings.TrimPrefix(line, "--"))
			if content == "" {
				builder.WriteString(fmt.Sprintf("%s\n", text))
				inHeader = false
				continue
			}

			parts := strings.SplitN(content, ":", 2)
			if len(parts) != 2 {
				builder.WriteString(fmt.Sprintf("%s\n", text))
				inHeader = false
				continue
			}

			key := strings.ToLower(strings.TrimSpace(parts[0]))
			value := strings.TrimSpace(parts[1])
			meta.Data[key] = value
			continue
		}

		builder.WriteString(fmt.Sprintf("%s\n", text))
	}

	if err := scanner.Err(); err != nil {
		err = fmt.Errorf("error scanning metadata file: %v", err)
		return nil, err
	}

	meta.Content = strings.TrimSpace(builder.String())
	return meta, nil
}

package main

import (
	"os"
	"os/exec"
)

// plugin configuraion
type plugin struct {
	Command   *exec.Cmd
	Target    string
	Registry  string
	Tag       string
	AccessKey string
	SecretKey string
}

// plugin constructor
func newPlugin() (plugin, error) {
	p := plugin{
		Target:    os.Getenv("PLUGIN_TARGET"),
		Registry:  os.Getenv("PLUGIN_REGISTRY"),
		Tag:       os.Getenv("PLUGIN_TAG"),
		AccessKey: os.Getenv("PLUGIN_ACCESS_KEY"),
		SecretKey: os.Getenv("PLUGIN_SECRET_KEY"),
	}

	if p.Registry != "" {
		// convenience variable to be read by bazel workspace status scripts
		os.Setenv("DOCKER_REGISTRY", p.Registry)
	}

	if p.Tag != "" {
		// convenience variable to be read by bazel workspace status scripts
		os.Setenv("IMAGE_TAG", p.Tag)
	}

	// setup the credentials used by the amazon-ecr-credential-helper
	if p.AccessKey != "" && p.SecretKey != "" {
		os.Setenv("AWS_ACCESS_KEY_ID", p.AccessKey)
		os.Setenv("AWS_SECRET_ACCESS_KEY", p.SecretKey)
	}

	return p, nil
}

// Exec runs plugin.Command
func (p *plugin) Exec() error {
	p.Command = exec.Command("bazel", "run", p.Target)
	p.Command.Stdout = os.Stdout
	p.Command.Stderr = os.Stderr
	return p.Command.Run()
}

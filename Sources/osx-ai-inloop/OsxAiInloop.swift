// OsxAiInloop.swift
// Root command for osx-ai-inloop. Dispatches to subcommands via ArgumentParser.

import ArgumentParser

struct OsxAiInloop: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "osx-ai-inloop",
        abstract: "A Unix-friendly CLI wrapper for Apple's on-device Foundation Models.",
        discussion: """
        Reads prompts from stdin or --prompt, writes responses to stdout.
        Pipe JSON or plain text in; get JSON or plain text out.

        EXAMPLES:
          echo '{"prompt":"Explain Swift async/await"}' | osx-ai-inloop
          osx-ai-inloop generate --prompt "What is an actor?" --format text
          osx-ai-inloop check
          osx-ai-inloop models
          osx-ai-inloop version
        """,
        subcommands: [
            GenerateCommand.self,
            CheckCommand.self,
            ModelsCommand.self,
            VersionCommand.self,
        ],
        defaultSubcommand: GenerateCommand.self
    )
}

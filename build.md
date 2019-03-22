# Build
> These notes are for a Linux (Ubuntu) machine.
> For other platforms, the commands may need to be adjusted.

## Pre-requisites
1. .NET Core SDK v2.2.x is installed
2. `dotnet` is in your PATH
3. Internet connection is alive
   - to restore dependencies
   - not needed after first build
4. Parent folder for source tree is identified, and created if necessary
   - `<Source-Tree-Parent>` 
   - This placeholder will be used below
   - Replace all instances when you have the name
5. Output folder for compiled binaries is identified, and created if necessary
   - `<Output-Folder>` 
   - This placeholder will be used below
   - Replace all instances when you have the name

## Download
- Navigate to folder where you want the source tree
  - `cd <Source-Tree-Parent>`
- Get the source tree from git
  - `git clone <todo:put-git-url>`

## Build binaries
- Navigate to project root
`cd <todo:put-project-folder-name>`
- Compile and Build the binaries
`dotnet build -c Release -o <Output-Folder> 40-Develop/t4my/t4my.csproj`

## Run
- Navigate to output folder
	`cd <Output-Folder>`

- For runtime options, see [Syntax and Usage](Usage.md#usage)


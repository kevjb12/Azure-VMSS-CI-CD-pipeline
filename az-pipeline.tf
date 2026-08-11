trigger:
- main

stages:
- stage: Build
  jobs:
  - job: Build
    pool:
      vmImage: 'ubuntu-latest'

    steps:

    - task: TerraformInstaller@1
      inputs:
        terraformVersion: 'latest'

    - task: TerraformTask@5
      displayName: Tf init
      inputs:
        provider: 'azurerm'
        command: 'init'
        backendServiceArm: 'Azure-Service-Connection'
        backendAzureRmStorageAccountName: '<terraform-state-storage-account>'
        backendAzureRmContainerName: '<state-container>'
        backendAzureRmKey: 'terraform.tfstate'

    - task: TerraformTask@5
      displayName: Tf validate
      inputs:
        provider: 'azurerm'
        command: 'validate'

    - task: TerraformTask@5
      displayName: Tf format
      inputs:
        provider: 'azurerm'
        command: 'custom'
        outputTo: 'console'
        customCommand: 'fmt'
        environmentServiceNameAzureRM: 'Azure-Service-Connection'

    - task: TerraformTask@5
      displayName: Tf plan
      inputs:
        provider: 'azurerm'
        command: 'plan'
        commandOptions: '-out $(Build.SourcesDirectory)/tfplanfile'
        environmentServiceNameAzureRM: 'Azure-Service-Connection'

    - task: ArchiveFiles@2
      displayName: Archive files
      inputs:
        rootFolderOrFile: '$(Build.SourcesDirectory)/'
        includeRootFolder: false
        archiveType: 'zip'
        archiveFile: '$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip'
        replaceExistingArchive: true

    - task: PublishBuildArtifacts@1
      inputs:
        PathtoPublish: '$(Build.ArtifactStagingDirectory)'
        ArtifactName: '$(Build.BuildId)-build'
        publishLocation: 'Container'

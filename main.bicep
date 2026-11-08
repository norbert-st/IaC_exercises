param appserviceName string = 'toy-product-launch-ns12345'
param location string = 'swedencentral'

var appservicePlanName = 'toy-product-launch-plan-starter'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'toylaunchstoragens12345'
  location: location
  sku: {
    name: 'Standard_LRS'
}
kind: 'StorageV2'
properties: {
    accessTier: 'Hot'
  }
}
resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: appservicePlanName
  location: location
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
  name: appserviceName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

// Ultralytics 🚀 AGPL-3.0 License - https://ultralytics.com/license

import CoreML

public class LocalModel: YoloModel {
  public var task: String
  var modelName: String

  public init(modelName: String, task: String) {
    self.modelName = modelName
    self.task = task
  }

  public func loadModel() async throws -> MLModel? {
    let path = Bundle.main.path(forResource: modelName, ofType: "mlmodelc")
      
    guard let modelPath = path else {
      return nil
    }
    let mlModel = try! MLModel(contentsOf: URL(fileURLWithPath: modelPath))

    return mlModel
  }
}

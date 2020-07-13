import Cocoa
import FlutterMacOS
import Foundation
import ServiceManagement

public class LaunchAtLoginPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "launch_at_login", binaryMessenger: registrar.messenger)
    let instance = LaunchAtLoginPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isEnabled":
        break;
    case "enable":
        LaunchAtLogin.isEnabled = true
    case "disable":
        LaunchAtLogin.isEnabled = false
    default:
        result(FlutterMethodNotImplemented)
        return;
    }
    result(LaunchAtLogin.isEnabled)
  }
}

public struct LaunchAtLogin {
    private static let id = "\(Bundle.main.bundleIdentifier!)-LaunchAtLoginHelper"

    public static var isEnabled: Bool {
        get {
            guard let jobs = (SMCopyAllJobDictionaries(kSMDomainUserLaunchd).takeRetainedValue() as? [[String: AnyObject]]) else {
                return false
            }

            let job = jobs.first { $0["Label"] as! String == id }

            return job?["OnDemand"] as? Bool ?? false
        }
        set {
            SMLoginItemSetEnabled(id as CFString, newValue)
        }
    }
}

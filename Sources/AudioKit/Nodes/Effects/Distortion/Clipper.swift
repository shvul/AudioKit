// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import CAudioKit

/// Clips a signal to a predefined limit, in a "soft" manner, using one of three methods.
public class Clipper: NodeBase {

    let input: Node
    override public var connections: [Node] { [input] }

    // MARK: - Parameters

    /// Specification details for limit
    public static let limitDef = NodeParameterDef(
        identifier: "limit",
        name: "Threshold",
        address: akGetParameterAddress("ClipperParameterLimit"),
        defaultValue: 1.0,
        range: 0.0 ... 1.0,
        unit: .generic)

    /// Threshold / limiting value.
    @Parameter(limitDef) public var limit: AUValue

    // MARK: - Initialization

    /// Initialize this clipper node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - limit: Threshold / limiting value.
    ///
    public init(
        _ input: Node,
        limit: AUValue = limitDef.defaultValue
        ) {
        self.input = input
        super.init(avAudioNode: AVAudioNode())

        avAudioNode = instantiate(effect: "clip")

        self.limit = limit
   }
}

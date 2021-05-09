// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import CAudioKit

/// Implements the DC blocking filter Y[i] = X[i] - X[i-1] + (igain * Y[i-1])  
/// Based on work by Perry Cook.
/// 
public class DCBlock: NodeBase {

    let input: Node
    override public var connections: [Node] { [input] }

    // MARK: - Parameters

    // MARK: - Initialization

    /// Initialize this filter node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///
    public init(
        _ input: Node
        ) {
        self.input = input
        super.init(avAudioNode: AVAudioNode())

        avAudioNode = instantiate(effect: "dcbk")

   }
}

// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import CAudioKit

/// This is an implementation of Zoelzer's parametric equalizer filter.
public class PeakingParametricEqualizerFilter: NodeBase {

    let input: Node
    override public var connections: [Node] { [input] }

    // MARK: - Parameters

    /// Specification details for centerFrequency
    public static let centerFrequencyDef = NodeParameterDef(
        identifier: "centerFrequency",
        name: "Center Frequency (Hz)",
        address: akGetParameterAddress("PeakingParametricEqualizerFilterParameterCenterFrequency"),
        defaultValue: 1_000,
        range: 12.0 ... 20_000.0,
        unit: .hertz)

    /// Center frequency.
    @Parameter(centerFrequencyDef) public var centerFrequency: AUValue

    /// Specification details for gain
    public static let gainDef = NodeParameterDef(
        identifier: "gain",
        name: "Gain",
        address: akGetParameterAddress("PeakingParametricEqualizerFilterParameterGain"),
        defaultValue: 1.0,
        range: 0.0 ... 10.0,
        unit: .generic)

    /// Amount at which the center frequency value shall be changed. A value of 1 is a flat response.
    @Parameter(gainDef) public var gain: AUValue

    /// Specification details for q
    public static let qDef = NodeParameterDef(
        identifier: "q",
        name: "Q",
        address: akGetParameterAddress("PeakingParametricEqualizerFilterParameterQ"),
        defaultValue: 0.707,
        range: 0.0 ... 2.0,
        unit: .generic)

    /// Q of the filter. sqrt(0.5) is no resonance.
    @Parameter(qDef) public var q: AUValue

    // MARK: - Initialization

    /// Initialize this equalizer node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - centerFrequency: Center frequency.
    ///   - gain: Amount at which the center frequency value shall be changed. A value of 1 is a flat response.
    ///   - q: Q of the filter. sqrt(0.5) is no resonance.
    ///
    public init(
        _ input: Node,
        centerFrequency: AUValue = centerFrequencyDef.defaultValue,
        gain: AUValue = gainDef.defaultValue,
        q: AUValue = qDef.defaultValue
        ) {
        self.input = input
        super.init(avAudioNode: AVAudioNode())

        avAudioNode = instantiate(effect: "peq0")

        self.centerFrequency = centerFrequency
        self.gain = gain
        self.q = q
   }
}

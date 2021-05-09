// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import CAudioKit

/// When fed with a pulse train, it will generate a series of overlapping grains. 
/// Overlapping will occur when 1/freq < dec, but there is no upper limit on the number of overlaps.
/// 
public class FormantFilter: NodeBase {

    let input: Node
    override public var connections: [Node] { [input] }

    // MARK: - Parameters

    /// Specification details for centerFrequency
    public static let centerFrequencyDef = NodeParameterDef(
        identifier: "centerFrequency",
        name: "Center Frequency (Hz)",
        address: akGetParameterAddress("FormantFilterParameterCenterFrequency"),
        defaultValue: 1_000,
        range: 12.0 ... 20_000.0,
        unit: .hertz)

    /// Center frequency.
    @Parameter(centerFrequencyDef) public var centerFrequency: AUValue

    /// Specification details for attackDuration
    public static let attackDurationDef = NodeParameterDef(
        identifier: "attackDuration",
        name: "Impulse response attack time (Seconds)",
        address: akGetParameterAddress("FormantFilterParameterAttackDuration"),
        defaultValue: 0.007,
        range: 0.0 ... 0.1,
        unit: .seconds)

    /// Impulse response attack time (in seconds).
    @Parameter(attackDurationDef) public var attackDuration: AUValue

    /// Specification details for decayDuration
    public static let decayDurationDef = NodeParameterDef(
        identifier: "decayDuration",
        name: "Impulse reponse decay time (Seconds)",
        address: akGetParameterAddress("FormantFilterParameterDecayDuration"),
        defaultValue: 0.04,
        range: 0.0 ... 0.1,
        unit: .seconds)

    /// Impulse reponse decay time (in seconds)
    @Parameter(decayDurationDef) public var decayDuration: AUValue

    // MARK: - Initialization

    /// Initialize this filter node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - centerFrequency: Center frequency.
    ///   - attackDuration: Impulse response attack time (in seconds).
    ///   - decayDuration: Impulse reponse decay time (in seconds)
    ///
    public init(
        _ input: Node,
        centerFrequency: AUValue = centerFrequencyDef.defaultValue,
        attackDuration: AUValue = attackDurationDef.defaultValue,
        decayDuration: AUValue = decayDurationDef.defaultValue
        ) {
        self.input = input
        super.init(avAudioNode: AVAudioNode())

        avAudioNode = instantiate(effect: "fofi")

        self.centerFrequency = centerFrequency
        self.attackDuration = attackDuration
        self.decayDuration = decayDuration
   }
}

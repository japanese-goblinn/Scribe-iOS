//
//  ITCommandVariables.swift
//
//  Variables associated with Scribe commands for the Italian keyboard.
//

func itSetConjugationLabels() {
  // Reset all form labels prior to assignment.
  for k in formLabelsDict.keys {
    formLabelsDict[k] = ""
  }
  
  formLabelsDict["FPS"] = "io"
  formLabelsDict["SPS"] = "tu"
  formLabelsDict["TPS"] = "lei/lui"
  formLabelsDict["FPP"] = "noi"
  formLabelsDict["SPP"] = "voi"
  formLabelsDict["TPP"] = "loro"
}

/// What the conjugation state is for the conjugate feature.
enum ITConjugationState {
  case present
  case preterite
  case imperfect
}

var itConjugationState: ITConjugationState = .present

/// Sets the title of the command bar when the keyboard is in conjugate mode.
func itGetConjugationTitle() -> String {
  if inputWordIsCapitalized == true {
    verbToDisplay = verbToConjugate.capitalized
  } else {
    verbToDisplay = verbToConjugate
  }
  switch itConjugationState {
  case .present:
    return commandPromptSpacing + "Presente: " + verbToDisplay
  case .preterite:
    return commandPromptSpacing + "Preterito: " + verbToDisplay
  case .imperfect:
    return commandPromptSpacing + "Imperfetto: " + verbToDisplay
  }
}

/// Returns the appropriate key in the verbs dictionary to access conjugations.
func itGetConjugationState() -> String {
  switch itConjugationState {
  case .present:
    return "pres"
  case .preterite:
    return "pret"
  case .imperfect:
    return "imp"
  }
}

/// Action associated with the left view switch button of the conjugation state.
func itConjugationStateLeft() {
  switch itConjugationState {
  case .present:
    break
  case .preterite:
    itConjugationState = .present
  case .imperfect:
    itConjugationState = .preterite
  }
}

/// Action associated with the right view switch button of the conjugation state.
func itConjugationStateRight() {
  switch itConjugationState {
  case .present:
    itConjugationState = .preterite
  case .preterite:
    itConjugationState = .imperfect
  case .imperfect:
    break
  }
}

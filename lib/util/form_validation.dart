enum CommunityFormState {
  Incomplete,
  Complete,
}

class FormValidation {
  String? selectedPeople;
  String? selectedCategory;
  String? inputText;

  FormValidation({this.selectedPeople, this.selectedCategory, this.inputText});

  CommunityFormState get formState {
    return (selectedPeople != null &&
            selectedCategory != null &&
            inputText != null &&
            inputText!.isNotEmpty)
        ? CommunityFormState.Complete
        : CommunityFormState.Incomplete;
  }

  String get formValues {
    return "selectedPeople: $selectedPeople, selectedCategory: $selectedCategory, inputText: $inputText";
  }
}

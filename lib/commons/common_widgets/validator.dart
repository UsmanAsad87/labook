String? ticketNoValidator(String? value) {
  if (value!.length > 8 || value.length < 4) {
    return 'Ticket no must be b/w 4 to 8 characters!';
  }
  return null;
}

abstract class ListSubmissionStatus {
  const ListSubmissionStatus();
}

class InitialListStatus extends ListSubmissionStatus {
  const InitialListStatus();
}

class FetchingDataListStatus extends ListSubmissionStatus {}

class FetchedDataListStatus extends ListSubmissionStatus {}

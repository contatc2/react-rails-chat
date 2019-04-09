const BASE_URL = '/api/v1/channels';

export const FETCH_MESSAGES = 'FETCH_MESSAGES';
export const MESSAGE_POSTED = 'MESSAGE_POSTED';

export function fetchMessages(channel) {
  const url = `${BASE_URL}/${channel}/messages`;
  const promise = fetch(url, { credentials: "same-origin" }).then(r => r.json());

  return {
    type: FETCH_MESSAGES,
    payload: promise // Will be resolved by redux-promise
  };
}

export function createMessage(channel, content) {
  const csrfToken = document.querySelector('meta[name="csrf-token"]').attributes.content.value;
  const url = `${BASE_URL}/${channel}/messages`;
  const body = { content }; // ES6 destructuring
  const promise = fetch(url, {
    method: 'POST',
    credentials: "same-origin",
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      'X-CSRF-Token': csrfToken
    },
    body: JSON.stringify(body)
  }).then(r => r.json());

  return {
    type: MESSAGE_CREATED,
    payload: promise // Will be resolved by redux-promise
  };
}

export function appendMessage(message) {
  return {
    type: MESSAGE_POSTED,
    payload: message
  }
}

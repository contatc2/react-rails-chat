import { FETCH_MESSAGES, MESSAGE_POSTED } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_MESSAGES: {
      return action.payload;
    }
    case MESSAGE_POSTED: {
      const copiedState = state.slice(0);
      copiedState.push(action.payload);
      return copiedState;
    }
    // case MESSAGE_POSTED:
    //   if (state.map(message => message.id).includes(action.payload.id)) {
    //     return state;
    //   } else {
    //     const copiedState = state.slice(0);
    //     copiedState.push(action.payload);
    //     return copiedState;
    //   }
    default:
      return state;
  }
}

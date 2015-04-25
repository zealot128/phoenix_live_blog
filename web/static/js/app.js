import {Socket} from "phoenix";

// let socket = new Socket("/ws")
// socket.join("topic:subtopic", {}, chan => {
// })

let App = {
};

export default App;

let socket = new Socket("/ws/posts");
socket.connect();
socket.join("posts:all", {}).receive("ok", (chan) => {
  console.log("joined that faacking channel");

  chan.on("new_post", (payload) => {
    if(payload.content) {
      $('#js-event-list').prepend(`
          <li>
            <strong>${payload.content}</strong>
            <small></small>
          </li>
          `);
    }
    console.log(payload);
  });
  window.chan = chan;
});

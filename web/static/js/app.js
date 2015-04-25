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
    console.log(payload);
    console.log("PONG!");
  });
  chan.push("new_post", {content: "FARK"});
  window.chan = chan;
});

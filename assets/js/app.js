import "../css/app.scss"
import * as Tone from "tone"
import {piano} from "./tonejs-ui/src/gui"
import {channel} from "./socket"
import "phoenix_html"

const sampler = new Tone.Sampler({
  urls: {
    A0: "A0.mp3",
    C1: "C1.mp3",
    "D#1": "Ds1.mp3",
    "F#1": "Fs1.mp3",
    A1: "A1.mp3",
    C2: "C2.mp3",
    "D#2": "Ds2.mp3",
    "F#2": "Fs2.mp3",
    A2: "A2.mp3",
    C3: "C3.mp3",
    "D#3": "Ds3.mp3",
    "F#3": "Fs3.mp3",
    A3: "A3.mp3",
    C4: "C4.mp3",
    "D#4": "Ds4.mp3",
    "F#4": "Fs4.mp3",
    A4: "A4.mp3",
    C5: "C5.mp3",
    "D#5": "Ds5.mp3",
    "F#5": "Fs5.mp3",
    A5: "A5.mp3",
    C6: "C6.mp3",
    "D#6": "Ds6.mp3",
    "F#6": "Fs6.mp3",
    A6: "A6.mp3",
    C7: "C7.mp3",
    "D#7": "Ds7.mp3",
    "F#7": "Fs7.mp3",
    A7: "A7.mp3",
    C8: "C8.mp3"
  },
  release: 1,
  baseUrl: "https://tonejs.github.io/audio/salamander/"
}).toDestination();

channel.on("noteon", payload => {
  const { note } = payload
  console.log({event: "recv:noteon", name: note.name, note: note})
  sampler.triggerAttack(payload.note.name)
})

channel.on("noteoff", payload => {
  const { note } = payload
  console.log({event: "recv:noteoff", name: note.name, note: note})
  sampler.triggerRelease(payload.note.name)
})

piano({
  parent: document.querySelector("#piano"),
  noteon: (note) => {
    console.log({event: "push:noteon", name: note.name, note: note})
    channel.push("noteon", {note})
  },
  noteoff: (note) => {
    console.log({event: "push:noteoff", name: note.name, note: note})
    channel.push("noteoff", {note})
  },
});

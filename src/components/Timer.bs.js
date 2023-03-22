// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";

import { UseBell } from "./UseBell.ts";
;

function Timer$Timer(props) {
  var isActive = props.isActive;
  var match = React.useState(function () {
        return 0;
      });
  var setSeconds = match[1];
  var seconds = match[0];
  React.useEffect(function () {
        var updateTime = function (param) {
          Curry._1(setSeconds, (function (param) {
                  return seconds + 1000 | 0;
                }));
        };
        if (!isActive) {
          return ;
        }
        var interval = setInterval(updateTime, 1000);
        return (function (param) {
                  clearInterval(interval);
                });
      });
  var play = seconds === 300000 ? (<UseBell />) : React.createElement(React.Fragment, undefined);
  var time = seconds / 1000 | 0;
  return React.createElement(React.Fragment, undefined, React.createElement("div", {
                  className: "text-center"
                }, time), play);
}

var Timer = {
  make: Timer$Timer
};

export {
  Timer ,
}
/*  Not a pure module */

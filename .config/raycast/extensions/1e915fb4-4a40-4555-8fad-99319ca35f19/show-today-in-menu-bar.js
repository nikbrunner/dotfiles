"use strict";var D=Object.create;var y=Object.defineProperty;var G=Object.getOwnPropertyDescriptor;var J=Object.getOwnPropertyNames;var R=Object.getPrototypeOf,k=Object.prototype.hasOwnProperty;var O=(t,r)=>()=>(r||t((r={exports:{}}).exports,r),r.exports),B=(t,r)=>{for(var e in r)y(t,e,{get:r[e],enumerable:!0})},A=(t,r,e,o)=>{if(r&&typeof r=="object"||typeof r=="function")for(let n of J(r))!k.call(t,n)&&n!==e&&y(t,n,{get:()=>r[n],enumerable:!(o=G(r,n))||o.enumerable});return t};var U=(t,r,e)=>(e=t!=null?D(R(t)):{},A(r||!t||!t.__esModule?y(e,"default",{value:t,enumerable:!0}):e,t)),_=t=>A(y({},"__esModule",{value:!0}),t);var b=O(d=>{"use strict";var v=d&&d.__assign||function(){return v=Object.assign||function(t){for(var r,e=1,o=arguments.length;e<o;e++){r=arguments[e];for(var n in r)Object.prototype.hasOwnProperty.call(r,n)&&(t[n]=r[n])}return t},v.apply(this,arguments)},q=d&&d.__importStar||function(t){if(t&&t.__esModule)return t;var r={};if(t!=null)for(var e in t)Object.hasOwnProperty.call(t,e)&&(r[e]=t[e]);return r.default=t,r};Object.defineProperty(d,"__esModule",{value:!0});var F=q(require("child_process"));function x(t){return Array.isArray(t)&&Object.prototype.hasOwnProperty.call(t,"raw")}function H(t,r){for(var e="",o=t.length,n=0;n<o;n++){var a=n<o-1?r[n]:"";e+=t[n]+a}return e.trim()}function h(t,r,e){return e===void 0&&(e={}),process.platform!=="darwin"?Promise.reject(new Error("osascript-tag requires macOS")):new Promise(function(o,n){var a=e.argv||[],u=[],l=H(t,r),c="AppleScript";e.language==="JavaScript"&&(c=e.language,l="(function(...argv){"+l+"})("+a.map(function(s){return JSON.stringify(s)})+")"),e.parse&&(u=["-s","s"]),typeof e.flags=="string"&&(u=["-s",e.flags]);var m=F.spawn("osascript",["-l",c].concat(u,["-e",l])),T="";m.stderr.on("data",function(s){T+=s.toString()});var S="";m.stdout.on("data",function(s){S+=s.toString()}),m.on("close",function(){if(T)n(T);else{var s=S;if(e.parse)try{s=JSON.parse(S)}catch(C){n(C)}o(s)}}),m.on("error",function(s){n(s)})})}function I(t){for(var r=[],e=1;e<arguments.length;e++)r[e-1]=arguments[e];return x(t)?h(t,r,{}):function(o){for(var n=[],a=1;a<arguments.length;a++)n[a-1]=arguments[a];return h(o,n,t)}}function j(t){for(var r=[],e=1;e<arguments.length;e++)r[e-1]=arguments[e];return x(t)?h(t,r,{language:"JavaScript"}):function(o){for(var n=[],a=1;a<arguments.length;a++)n[a-1]=arguments[a];return h(o,n,v({language:"JavaScript"},t))}}I.jxa=j;d.jxa=j;d.default=I});var V={};B(V,{default:()=>E});module.exports=_(V);var i=require("@raycast/api"),f=require("react");var p=require("@raycast/api"),w=U(b());var P=(0,p.getPreferenceValues)(),M=async t=>{try{return await w.default.jxa({parse:!0})`${t}`}catch(r){if(typeof r=="string"){let e=r.replace("execution error: Error: ","");e.match(/Application can't be found/)?(0,p.showToast)({style:p.Toast.Style.Failure,title:"Application not found",message:"Things must be running"}):(0,p.showToast)({style:p.Toast.Style.Failure,title:"Something went wrong",message:e})}}};var K={Inbox:"TMInboxListSource",Today:"TMTodayListSource",Anytime:"TMNextListSource",Upcoming:"TMCalendarListSource",Someday:"TMSomedayListSource"},L=t=>M(`
  const things = Application('${P.thingsAppIdentifier}');
  const todos = things.lists.byId('${K[t]}').toDos();
  return todos.map(todo => ({
    id: todo.id(),
    name: todo.name(),
    status: todo.status(),
    notes: todo.notes(),
    tags: todo.tagNames(),
    dueDate: todo.dueDate() && todo.dueDate().toISOString(),
    project: todo.project() && {
      id: todo.project().id(),
      name: todo.project().name(),
      tags: todo.project().tagNames(),
      area: todo.project().area() && {
        id: todo.project().area().id(),
        name: todo.project().area().name(),
        tags: todo.project().area().tagNames(),
      },
    },
    area: todo.area() && {
      id: todo.area().id(),
      name: todo.area().name(),
      tags: todo.area().tagNames(),
    },
  }));
`),$=(t,r,e)=>M(`
  const things = Application('${P.thingsAppIdentifier}');
  things.toDos.byId('${t}').${r} = '${e}';
`);var g=require("react/jsx-runtime"),N=30;function E(){let[t,r]=(0,f.useState)([]),[e,o]=(0,f.useState)(!0);async function n(){try{r(await L("Today"))}catch{}finally{o(!1)}}async function a(c){return await $(c,"status","completed"),n()}(0,f.useEffect)(()=>{n()},[]);let u=t.length>0?t[0].name:"",l=u.length>N?u.substring(0,N)+"\u2026":u;return(0,g.jsxs)(i.MenuBarExtra,{icon:"things-icon.png",title:l,tooltip:u,isLoading:e,children:[t.length>0?(0,g.jsxs)(g.Fragment,{children:[(0,g.jsx)(i.MenuBarExtra.Item,{title:"Complete",icon:i.Icon.CheckCircle,onAction:()=>{a(t[0].id)}}),(0,g.jsx)(i.MenuBarExtra.Separator,{}),(0,g.jsx)(i.MenuBarExtra.Item,{title:"Today"})]}):null,t.map(c=>(0,g.jsx)(i.MenuBarExtra.Item,{title:c.name,onAction:()=>{(0,i.open)(`things:///show?id=${c.id}`)}},c.id))]})}0&&(module.exports={});

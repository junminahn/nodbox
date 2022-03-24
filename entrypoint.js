// inspired by [actions/github-script](https://github.com/actions/github-script).
const script = process.argv.length > 2 ? process.argv[2] : '';
const AsyncFunction = Object.getPrototypeOf(async () => null).constructor;

function callAsyncFunction(args, source) {
  const fn = new AsyncFunction(...Object.keys(args), source);
  return fn(...Object.values(args));
}

async function main() {
  const result = await callAsyncFunction({ require }, script);
  if (result !== undefined) console.log(result);
}

main();

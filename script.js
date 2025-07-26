const display = document.getElementById('display');
let realExpression = '';
let displayExpression = '';

document.querySelectorAll('button').forEach(btn => {
  btn.addEventListener('click', () => {
    const value = btn.textContent;

    if (value === 'C') {
      realExpression = '';
      displayExpression = '';
      display.textContent = '0';
    } else if (value === '⌫') {
      realExpression = realExpression.slice(0, -1);
      displayExpression = displayExpression.slice(0, -1);
      display.textContent = displayExpression || '0';
    } else if (value === '=') {
      display.textContent = 'Hello world!';
    } else if (value === '×') {
      realExpression += '*';
      displayExpression += '×';
      display.textContent = displayExpression;
    } else if (value === '÷') {
      realExpression += '/';
      displayExpression += '÷';
      display.textContent = displayExpression;
    } else if (value === '±') {
      if (realExpression.startsWith('-')) {
        realExpression = realExpression.slice(1);
        displayExpression = displayExpression.slice(1);
      } else {
        realExpression = '-' + realExpression;
        displayExpression = '-' + displayExpression;
      }
      display.textContent = displayExpression;
    } else if (['mc', 'm+', 'm-', 'mr'].includes(value)) {
      // Do nothing
      return;
    } else {
      realExpression += value;
      displayExpression += value;
      display.textContent = displayExpression;
    }
  });
});

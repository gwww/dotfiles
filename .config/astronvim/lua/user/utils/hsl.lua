-- From: https://stackoverflow.com/questions/36721830/convert-hsl-to-rgb-and-hex
-- Converted from JS to Lua

local M = {}

M.hslToRgb = function(h, s, l)
	local a

	local function f(n)
		local k = (n + h / 30) % 12
		local color = l - a * math.max(math.min(k - 3, 9 - k, 1), -1)
		return math.floor(255 * color + 0.5)
	end

	l = l / 100
	a = s * math.min(l, 1 - l) / 100
	return { f(0), f(8), f(4) }
end

M.hslToHex = function(h, s, l)
	local rgb = M.hslToRgb(h, s, l)
	return string.format("#%02X%02X%02X", rgb[1], rgb[2], rgb[3])
end

return M

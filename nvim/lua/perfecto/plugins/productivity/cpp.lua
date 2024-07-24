function RunCppProgram()
	local filename = vim.fn.expand("%:p")
	vim.fn.fnamemodify(filename, ":t:r")

	if filename:match("%.cpp$") then
		local compile_command = "g++ -std=c++17 " .. filename .. " -o main 2> output.txt"
		vim.fn.system(compile_command)
		if vim.v.shell_error == 0 then
			local timeout_command = 'ulimit -t 10 && (./main > output.txt 2>&1 || echo "TLE" > output.txt)'
			vim.fn.system(timeout_command)
		else
			print("Compilation failed")
		end
		vim.fn.system('tmux send-keys -t 2 ":e" Enter')
		vim.fn.system('tmux send-keys -t 2 "nvim output.txt" Enter')
	else
		print("Current file is not a C++ source file.")
	end
end

function Archive(filename)
	local archive_folder = "/home/t-aswath/adsa/cpp/archive/"
	local archive_file = archive_folder .. filename .. ".cpp"
	local copy_command = "cat a.cpp >> " .. archive_file
	vim.fn.system(copy_command)
end

function Cls()
	vim.fn.system("cp /home/t-aswath/adsa/cpp/template.cpp /home/t-aswath/adsa/cpp/a.cpp")
	vim.fn.system('tmux send-keys -t 0 ":e" Enter')
end

function Csave(filename)
	Archive(filename)
	Cls()
end

vim.api.nvim_command("command! Com lua RunCppProgram()")
vim.api.nvim_command("command! -nargs=1 Save lua Archive(<f-args>)")
vim.api.nvim_command("command! Cls lua Cls()")
vim.api.nvim_command("command! -nargs=1 Csave lua Csave(<f-args>)")

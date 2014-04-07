task :jekyll do
    puts '* Changing the codepage'
    `chcp 65001`
    puts '* Running Jekyll server'
    puts '* Server running on localhost:4000'
    puts '* To terminate press Ctrl + C'
    `jekyll serve -w --drafts`
end
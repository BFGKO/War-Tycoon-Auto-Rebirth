local Parser = {}

function Parser:InnerText(html)
    local text = ""

    local tags = {}
    local inTag = false
    local tagStart = 0
    local tagEnd = 0
    for i = 1,#html do
        local letter = html:sub(i, i)
        -- local forwardLetter = html:sub(i+1, i+1)
        if letter == "<" then
            inTag = true
            tagStart = i
            if tagEnd > 0 then
                local innerText = string.sub(html, tagEnd+1, i-1)
                if #innerText > 0 then
                    text = text..innerText
                end
            end
        elseif letter == ">" and inTag then
            tags[#tags+1] = html:sub(tagStart, i)
            inTag = false
            tagEnd = i
        end
    end
    
    -- text = text:gsub("\n", ";")
    text = text:gsub("  ", "")
    text = text:gsub("&quot;", '"')
    text = text:gsub("&gt;", '=')
    print(text)
end

function Parser:GetTags(html)
    local tags = {}
    local inTag = false
    local tagStart = 0
    local tagEnd = 0
    for i = 1,#html do
        local letter = html:sub(i, i)
        -- local forwardLetter = html:sub(i+1, i+1)
        if letter == "<" then
            inTag = true
            tagStart = i
        elseif letter == ">" and inTag then
            tags[#tags+1] = html:sub(tagStart, i)
            inTag = false
        end
    end
    return tags
end

function Parser:FindByClass(html , class)
    -- local tags = self:GetTags(html)
    local start = html:find(class)
    print(start)
end

Parser:FindByClass([[
    <table data-hpc class="highlight tab-size js-file-line-container js-code-nav-container js-tagsearch-file" data-tab-size="8" data-paste-markdown-skip data-tagsearch-lang="Lua" data-tagsearch-path="Modules/Robber.lua">
        <tr>
          <td id="L1" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="1"></td>
          <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-k">local</span> Debris <span class="pl-k">=</span> game:<span class="pl-c1">GetService</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Debris<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L2" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="2"></td>
          <td id="LC2" class="blob-code blob-code-inner js-file-line"><span class="pl-k">local</span> LocalizationService <span class="pl-k">=</span> game:<span class="pl-c1">GetService</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>LocalizationService<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L3" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="3"></td>
          <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-k">local</span> Players <span class="pl-k">=</span> game:<span class="pl-c1">GetService</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Players<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L4" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="4"></td>
          <td id="LC4" class="blob-code blob-code-inner js-file-line"><span class="pl-k">local</span> player <span class="pl-k">=</span> Players.<span class="pl-smi">LocalPlayer</span></td>
        </tr>
        <tr>
          <td id="L5" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="5"></td>
          <td id="LC5" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L6" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="6"></td>
          <td id="LC6" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L7" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="7"></td>
          <td id="LC7" class="blob-code blob-code-inner js-file-line"><span class="pl-k">local</span> Robber <span class="pl-k">=</span> {}</td>
        </tr>
        <tr>
          <td id="L8" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="8"></td>
          <td id="LC8" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L9" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="9"></td>
          <td id="LC9" class="blob-code blob-code-inner js-file-line"><span class="pl-k">function</span> <span class="pl-en">Robber:LoadTycoon</span>(<span class="pl-smi">tycoon</span> : <span class="pl-smi">Model</span>)</td>
        </tr>
        <tr>
          <td id="L10" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="10"></td>
          <td id="LC10" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> standPart <span class="pl-k">=</span> Instance.<span class="pl-c1">new</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Part<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L11" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="11"></td>
          <td id="LC11" class="blob-code blob-code-inner js-file-line">    standPart.<span class="pl-smi">Size</span> <span class="pl-k">=</span> Vector3.<span class="pl-c1">new</span>(<span class="pl-c1">50</span>, <span class="pl-c1">1</span>, <span class="pl-c1">50</span>)</td>
        </tr>
        <tr>
          <td id="L12" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="12"></td>
          <td id="LC12" class="blob-code blob-code-inner js-file-line">    standPart.<span class="pl-smi">Anchored</span> <span class="pl-k">=</span> <span class="pl-c1">true</span></td>
        </tr>
        <tr>
          <td id="L13" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="13"></td>
          <td id="LC13" class="blob-code blob-code-inner js-file-line">    standPart.<span class="pl-smi">Parent</span> <span class="pl-k">=</span> workspace</td>
        </tr>
        <tr>
          <td id="L14" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="14"></td>
          <td id="LC14" class="blob-code blob-code-inner js-file-line">    standPart.<span class="pl-smi">Material</span> <span class="pl-k">=</span> Enum.<span class="pl-smi">Material</span>.<span class="pl-smi">SmoothPlastic</span></td>
        </tr>
        <tr>
          <td id="L15" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="15"></td>
          <td id="LC15" class="blob-code blob-code-inner js-file-line">    standPart.<span class="pl-smi">Transparency</span> <span class="pl-k">=</span> <span class="pl-c1">0.5</span></td>
        </tr>
        <tr>
          <td id="L16" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="16"></td>
          <td id="LC16" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L17" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="17"></td>
          <td id="LC17" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L18" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="18"></td>
          <td id="LC18" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> character <span class="pl-k">=</span> player.<span class="pl-smi">Character</span></td>
        </tr>
        <tr>
          <td id="L19" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="19"></td>
          <td id="LC19" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> rootPart <span class="pl-k">=</span> character:<span class="pl-c1">WaitForChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>HumanoidRootPart<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L20" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="20"></td>
          <td id="LC20" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L21" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="21"></td>
          <td id="LC21" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> pivot <span class="pl-k">=</span> tycoon.<span class="pl-smi">WorldPivot</span></td>
        </tr>
        <tr>
          <td id="L22" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="22"></td>
          <td id="LC22" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L23" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="23"></td>
          <td id="LC23" class="blob-code blob-code-inner js-file-line">    rootPart.<span class="pl-smi">Anchored</span> <span class="pl-k">=</span> <span class="pl-c1">true</span></td>
        </tr>
        <tr>
          <td id="L24" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="24"></td>
          <td id="LC24" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L25" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="25"></td>
          <td id="LC25" class="blob-code blob-code-inner js-file-line">    rootPart.<span class="pl-smi">CFrame</span> <span class="pl-k">=</span> pivot <span class="pl-k">+</span> Vector3.<span class="pl-c1">new</span>(<span class="pl-c1">0</span>, <span class="pl-c1">250</span>, <span class="pl-c1">0</span>)</td>
        </tr>
        <tr>
          <td id="L26" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="26"></td>
          <td id="LC26" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L27" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="27"></td>
          <td id="LC27" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> startTime <span class="pl-k">=</span> <span class="pl-c1">tick</span>()</td>
        </tr>
        <tr>
          <td id="L28" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="28"></td>
          <td id="LC28" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">repeat</span></td>
        </tr>
        <tr>
          <td id="L29" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="29"></td>
          <td id="LC29" class="blob-code blob-code-inner js-file-line">        task.<span class="pl-c1">wait</span>(<span class="pl-c1">0.1</span>)</td>
        </tr>
        <tr>
          <td id="L30" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="30"></td>
          <td id="LC30" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">until</span> tycoon:<span class="pl-c1">FindFirstChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Raid<span class="pl-pds">&quot;</span></span>) <span class="pl-k">or</span> <span class="pl-c1">tick</span>() <span class="pl-k">&gt;=</span> startTime<span class="pl-k">+</span><span class="pl-c1">5</span></td>
        </tr>
        <tr>
          <td id="L31" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="31"></td>
          <td id="LC31" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L32" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="32"></td>
          <td id="LC32" class="blob-code blob-code-inner js-file-line">    standPart:<span class="pl-c1">Destroy</span>()</td>
        </tr>
        <tr>
          <td id="L33" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="33"></td>
          <td id="LC33" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L34" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="34"></td>
          <td id="LC34" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L35" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="35"></td>
          <td id="LC35" class="blob-code blob-code-inner js-file-line"><span class="pl-k">function</span> <span class="pl-en">Robber:FindRobbableTycoon</span>()</td>
        </tr>
        <tr>
          <td id="L36" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="36"></td>
          <td id="LC36" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> character <span class="pl-k">=</span> player.<span class="pl-smi">Character</span></td>
        </tr>
        <tr>
          <td id="L37" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="37"></td>
          <td id="LC37" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> rootPart <span class="pl-k">=</span> character:<span class="pl-c1">WaitForChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>HumanoidRootPart<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L38" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="38"></td>
          <td id="LC38" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L39" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="39"></td>
          <td id="LC39" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> startCFrame <span class="pl-k">=</span> rootPart.<span class="pl-smi">CFrame</span></td>
        </tr>
        <tr>
          <td id="L40" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="40"></td>
          <td id="LC40" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">self</span>.<span class="pl-smi">startCFrame</span> <span class="pl-k">=</span> startCFrame</td>
        </tr>
        <tr>
          <td id="L41" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="41"></td>
          <td id="LC41" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L42" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="42"></td>
          <td id="LC42" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> tycoons : Model <span class="pl-k">=</span> workspace.<span class="pl-smi">PlayerTycoons</span></td>
        </tr>
        <tr>
          <td id="L43" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="43"></td>
          <td id="LC43" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">for</span> i,tycoon : Model <span class="pl-k">in</span> <span class="pl-c1">pairs</span>(tycoons:<span class="pl-c1">GetChildren</span>()) <span class="pl-k">do</span></td>
        </tr>
        <tr>
          <td id="L44" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="44"></td>
          <td id="LC44" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> ownerId <span class="pl-k">=</span> tycoon:<span class="pl-c1">GetAttribute</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Player<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L45" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="45"></td>
          <td id="LC45" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> ownerName <span class="pl-k">=</span> tycoon:<span class="pl-c1">GetAttribute</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>PlayerName<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L46" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="46"></td>
          <td id="LC46" class="blob-code blob-code-inner js-file-line">        </td>
        </tr>
        <tr>
          <td id="L47" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="47"></td>
          <td id="LC47" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> ownerId <span class="pl-k">==</span> player.<span class="pl-smi">UserId</span> <span class="pl-k">then</span></td>
        </tr>
        <tr>
          <td id="L48" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="48"></td>
          <td id="LC48" class="blob-code blob-code-inner js-file-line">            continue</td>
        </tr>
        <tr>
          <td id="L49" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="49"></td>
          <td id="LC49" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L50" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="50"></td>
          <td id="LC50" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L51" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="51"></td>
          <td id="LC51" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">self</span>:<span class="pl-c1">LoadTycoon</span>(tycoon)</td>
        </tr>
        <tr>
          <td id="L52" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="52"></td>
          <td id="LC52" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L53" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="53"></td>
          <td id="LC53" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> hasBunker <span class="pl-k">=</span> tycoon:<span class="pl-c1">FindFirstChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Raid<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L54" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="54"></td>
          <td id="LC54" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> <span class="pl-k">not</span> hasBunker <span class="pl-k">then</span></td>
        </tr>
        <tr>
          <td id="L55" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="55"></td>
          <td id="LC55" class="blob-code blob-code-inner js-file-line">            <span class="pl-c1">print</span>(ownerName, <span class="pl-s"><span class="pl-pds">&quot;</span>doesnt have bunker<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L56" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="56"></td>
          <td id="LC56" class="blob-code blob-code-inner js-file-line">            continue</td>
        </tr>
        <tr>
          <td id="L57" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="57"></td>
          <td id="LC57" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L58" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="58"></td>
          <td id="LC58" class="blob-code blob-code-inner js-file-line">        </td>
        </tr>
        <tr>
          <td id="L59" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="59"></td>
          <td id="LC59" class="blob-code blob-code-inner js-file-line">        </td>
        </tr>
        <tr>
          <td id="L60" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="60"></td>
          <td id="LC60" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> unlocks <span class="pl-k">=</span> tycoon:<span class="pl-c1">WaitForChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Unlocks<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L61" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="61"></td>
          <td id="LC61" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L62" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="62"></td>
          <td id="LC62" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> vaultRoom1 <span class="pl-k">=</span> unlocks:<span class="pl-c1">FindFirstChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>VaultRoom1<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L63" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="63"></td>
          <td id="LC63" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> <span class="pl-k">not</span> vaultRoom1 <span class="pl-k">or</span> <span class="pl-k">not</span> vaultRoom1:<span class="pl-c1">FindFirstChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Cooldown<span class="pl-pds">&quot;</span></span>) <span class="pl-k">then</span></td>
        </tr>
        <tr>
          <td id="L64" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="64"></td>
          <td id="LC64" class="blob-code blob-code-inner js-file-line">            continue</td>
        </tr>
        <tr>
          <td id="L65" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="65"></td>
          <td id="LC65" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L66" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="66"></td>
          <td id="LC66" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> cooldownGui <span class="pl-k">=</span> vaultRoom1.<span class="pl-smi">Cooldown</span>.<span class="pl-smi">SurfaceGui</span>.<span class="pl-smi">Frame</span>.<span class="pl-smi">Time</span></td>
        </tr>
        <tr>
          <td id="L67" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="67"></td>
          <td id="LC67" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> canRob <span class="pl-k">=</span> cooldownGui.<span class="pl-smi">Text</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>READY<span class="pl-pds">&quot;</span></span></td>
        </tr>
        <tr>
          <td id="L68" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="68"></td>
          <td id="LC68" class="blob-code blob-code-inner js-file-line">        </td>
        </tr>
        <tr>
          <td id="L69" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="69"></td>
          <td id="LC69" class="blob-code blob-code-inner js-file-line">        </td>
        </tr>
        <tr>
          <td id="L70" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="70"></td>
          <td id="LC70" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> <span class="pl-k">not</span> canRob <span class="pl-k">then</span></td>
        </tr>
        <tr>
          <td id="L71" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="71"></td>
          <td id="LC71" class="blob-code blob-code-inner js-file-line">            <span class="pl-c1">print</span>(ownerName, <span class="pl-s"><span class="pl-pds">&quot;</span>robbable in<span class="pl-pds">&quot;</span></span>, cooldownGui.<span class="pl-smi">Text</span>)</td>
        </tr>
        <tr>
          <td id="L72" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="72"></td>
          <td id="LC72" class="blob-code blob-code-inner js-file-line">            continue</td>
        </tr>
        <tr>
          <td id="L73" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="73"></td>
          <td id="LC73" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">else</span></td>
        </tr>
        <tr>
          <td id="L74" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="74"></td>
          <td id="LC74" class="blob-code blob-code-inner js-file-line">            <span class="pl-c1">print</span>(ownerName, cooldownGui.<span class="pl-smi">Text</span>)</td>
        </tr>
        <tr>
          <td id="L75" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="75"></td>
          <td id="LC75" class="blob-code blob-code-inner js-file-line">            <span class="pl-k">return</span> tycoon</td>
        </tr>
        <tr>
          <td id="L76" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="76"></td>
          <td id="LC76" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L77" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="77"></td>
          <td id="LC77" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L78" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="78"></td>
          <td id="LC78" class="blob-code blob-code-inner js-file-line">    rootPart.<span class="pl-smi">Anchored</span> <span class="pl-k">=</span> <span class="pl-c1">false</span></td>
        </tr>
        <tr>
          <td id="L79" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="79"></td>
          <td id="LC79" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L80" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="80"></td>
          <td id="LC80" class="blob-code blob-code-inner js-file-line">    rootPart.<span class="pl-smi">CFrame</span> <span class="pl-k">=</span> startCFrame</td>
        </tr>
        <tr>
          <td id="L81" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="81"></td>
          <td id="LC81" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L82" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="82"></td>
          <td id="LC82" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L83" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="83"></td>
          <td id="LC83" class="blob-code blob-code-inner js-file-line"><span class="pl-k">function</span> <span class="pl-en">Robber:GetSafes</span>(<span class="pl-smi">tycoon</span> : <span class="pl-smi">Model</span>)</td>
        </tr>
        <tr>
          <td id="L84" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="84"></td>
          <td id="LC84" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> unlocks <span class="pl-k">=</span> tycoon:<span class="pl-c1">WaitForChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Unlocks<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L85" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="85"></td>
          <td id="LC85" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> safes <span class="pl-k">=</span> {}</td>
        </tr>
        <tr>
          <td id="L86" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="86"></td>
          <td id="LC86" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">for</span> i, safe : Model <span class="pl-k">in</span> <span class="pl-c1">pairs</span>(unlocks:<span class="pl-c1">GetDescendants</span>()) <span class="pl-k">do</span></td>
        </tr>
        <tr>
          <td id="L87" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="87"></td>
          <td id="LC87" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> <span class="pl-k">not</span> (safe.<span class="pl-smi">Name</span>:<span class="pl-c1">match</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Safe<span class="pl-pds">&quot;</span></span>) <span class="pl-k">or</span> safe.<span class="pl-smi">Name</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>DiamondMiner<span class="pl-pds">&quot;</span></span>) <span class="pl-k">then</span></td>
        </tr>
        <tr>
          <td id="L88" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="88"></td>
          <td id="LC88" class="blob-code blob-code-inner js-file-line">            continue</td>
        </tr>
        <tr>
          <td id="L89" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="89"></td>
          <td id="LC89" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L90" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="90"></td>
          <td id="LC90" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> hasSafe <span class="pl-k">=</span> safe:<span class="pl-c1">FindFirstChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Safe<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L91" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="91"></td>
          <td id="LC91" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> hasSafe <span class="pl-k">then</span></td>
        </tr>
        <tr>
          <td id="L92" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="92"></td>
          <td id="LC92" class="blob-code blob-code-inner js-file-line">            safe <span class="pl-k">=</span> hasSafe</td>
        </tr>
        <tr>
          <td id="L93" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="93"></td>
          <td id="LC93" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L94" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="94"></td>
          <td id="LC94" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> enabled <span class="pl-k">=</span> safe:<span class="pl-c1">FindFirstChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Enabled<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L95" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="95"></td>
          <td id="LC95" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> enabled <span class="pl-k">and</span> enabled.<span class="pl-smi">Color</span> <span class="pl-k">==</span> Color3.<span class="pl-c1">fromRGB</span>(<span class="pl-c1">25</span>, <span class="pl-c1">175</span>, <span class="pl-c1">30</span>) <span class="pl-k">then</span></td>
        </tr>
        <tr>
          <td id="L96" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="96"></td>
          <td id="LC96" class="blob-code blob-code-inner js-file-line">            <span class="pl-c1">table.insert</span>(safes, safe)</td>
        </tr>
        <tr>
          <td id="L97" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="97"></td>
          <td id="LC97" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L98" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="98"></td>
          <td id="LC98" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L99" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="99"></td>
          <td id="LC99" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">print</span>((<span class="pl-s"><span class="pl-pds">&quot;</span>found %d safes<span class="pl-pds">&quot;</span></span>):<span class="pl-c1">format</span>(<span class="pl-k">#</span>safes))</td>
        </tr>
        <tr>
          <td id="L100" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="100"></td>
          <td id="LC100" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> safes</td>
        </tr>
        <tr>
          <td id="L101" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="101"></td>
          <td id="LC101" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L102" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="102"></td>
          <td id="LC102" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L103" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="103"></td>
          <td id="LC103" class="blob-code blob-code-inner js-file-line"><span class="pl-k">function</span> <span class="pl-en">Robber:RobTycoon</span>(<span class="pl-smi">tycoon</span> : <span class="pl-smi">Model</span>)</td>
        </tr>
        <tr>
          <td id="L104" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="104"></td>
          <td id="LC104" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> character <span class="pl-k">=</span> player.<span class="pl-smi">Character</span></td>
        </tr>
        <tr>
          <td id="L105" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="105"></td>
          <td id="LC105" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> rootPart <span class="pl-k">=</span> character:<span class="pl-c1">WaitForChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>HumanoidRootPart<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L106" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="106"></td>
          <td id="LC106" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L107" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="107"></td>
          <td id="LC107" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> raid <span class="pl-k">=</span> tycoon:<span class="pl-c1">WaitForChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Raid<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L108" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="108"></td>
          <td id="LC108" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L109" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="109"></td>
          <td id="LC109" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> ownerDoors <span class="pl-k">=</span> {}</td>
        </tr>
        <tr>
          <td id="L110" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="110"></td>
          <td id="LC110" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">for</span> i,ownerDoor : Model <span class="pl-k">in</span> <span class="pl-c1">pairs</span>(tycoon.<span class="pl-smi">Unlocks</span>:<span class="pl-c1">GetChildren</span>()) <span class="pl-k">do</span></td>
        </tr>
        <tr>
          <td id="L111" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="111"></td>
          <td id="LC111" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> target <span class="pl-k">=</span> ownerDoor:<span class="pl-c1">FindFirstChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Target<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L112" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="112"></td>
          <td id="LC112" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> <span class="pl-k">not</span> target <span class="pl-k">then</span> continue <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L113" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="113"></td>
          <td id="LC113" class="blob-code blob-code-inner js-file-line">        ownerDoors[<span class="pl-k">#</span>ownerDoors<span class="pl-k">+</span><span class="pl-c1">1</span>] <span class="pl-k">=</span> ownerDoor</td>
        </tr>
        <tr>
          <td id="L114" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="114"></td>
          <td id="LC114" class="blob-code blob-code-inner js-file-line">        ownerDoor.<span class="pl-smi">Parent</span> <span class="pl-k">=</span> <span class="pl-c1">nil</span></td>
        </tr>
        <tr>
          <td id="L115" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="115"></td>
          <td id="LC115" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L116" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="116"></td>
          <td id="LC116" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L117" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="117"></td>
          <td id="LC117" class="blob-code blob-code-inner js-file-line">    </td>
        </tr>
        <tr>
          <td id="L118" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="118"></td>
          <td id="LC118" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L119" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="119"></td>
          <td id="LC119" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L120" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="120"></td>
          <td id="LC120" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L121" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="121"></td>
          <td id="LC121" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L122" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="122"></td>
          <td id="LC122" class="blob-code blob-code-inner js-file-line">    rootPart.<span class="pl-smi">CFrame</span> <span class="pl-k">=</span> raid.<span class="pl-smi">CFrame</span></td>
        </tr>
        <tr>
          <td id="L123" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="123"></td>
          <td id="LC123" class="blob-code blob-code-inner js-file-line">    rootPart.<span class="pl-smi">Anchored</span> <span class="pl-k">=</span> <span class="pl-c1">true</span></td>
        </tr>
        <tr>
          <td id="L124" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="124"></td>
          <td id="LC124" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L125" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="125"></td>
          <td id="LC125" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">firetouchinterest</span>(raid, rootPart, <span class="pl-c1">0</span>)</td>
        </tr>
        <tr>
          <td id="L126" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="126"></td>
          <td id="LC126" class="blob-code blob-code-inner js-file-line">    task.<span class="pl-c1">wait</span>(<span class="pl-c1">0.1</span>)</td>
        </tr>
        <tr>
          <td id="L127" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="127"></td>
          <td id="LC127" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">firetouchinterest</span>(raid, rootPart, <span class="pl-c1">1</span>)</td>
        </tr>
        <tr>
          <td id="L128" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="128"></td>
          <td id="LC128" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L129" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="129"></td>
          <td id="LC129" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">print</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Activated raid<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L130" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="130"></td>
          <td id="LC130" class="blob-code blob-code-inner js-file-line">    rootPart.<span class="pl-smi">Anchored</span> <span class="pl-k">=</span> <span class="pl-c1">false</span></td>
        </tr>
        <tr>
          <td id="L131" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="131"></td>
          <td id="LC131" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L132" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="132"></td>
          <td id="LC132" class="blob-code blob-code-inner js-file-line">    task.<span class="pl-c1">wait</span>(<span class="pl-c1">1</span>)</td>
        </tr>
        <tr>
          <td id="L133" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="133"></td>
          <td id="LC133" class="blob-code blob-code-inner js-file-line">    </td>
        </tr>
        <tr>
          <td id="L134" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="134"></td>
          <td id="LC134" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> safes <span class="pl-k">=</span> <span class="pl-c1">self</span>:<span class="pl-c1">GetSafes</span>(tycoon)</td>
        </tr>
        <tr>
          <td id="L135" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="135"></td>
          <td id="LC135" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L136" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="136"></td>
          <td id="LC136" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">for</span> i,safe <span class="pl-k">in</span> <span class="pl-c1">pairs</span>(safes) <span class="pl-k">do</span></td>
        </tr>
        <tr>
          <td id="L137" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="137"></td>
          <td id="LC137" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> enabled : Part <span class="pl-k">=</span> safe.<span class="pl-smi">Enabled</span></td>
        </tr>
        <tr>
          <td id="L138" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="138"></td>
          <td id="LC138" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L139" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="139"></td>
          <td id="LC139" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> attachment : Attachment <span class="pl-k">=</span> enabled:<span class="pl-c1">FindFirstChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>HackAttachment<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L140" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="140"></td>
          <td id="LC140" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> <span class="pl-k">not</span> attachment <span class="pl-k">then</span></td>
        </tr>
        <tr>
          <td id="L141" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="141"></td>
          <td id="LC141" class="blob-code blob-code-inner js-file-line">            continue</td>
        </tr>
        <tr>
          <td id="L142" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="142"></td>
          <td id="LC142" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L143" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="143"></td>
          <td id="LC143" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">local</span> proximityPrompt <span class="pl-k">=</span> attachment:<span class="pl-c1">WaitForChild</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>ProximityPrompt<span class="pl-pds">&quot;</span></span>)</td>
        </tr>
        <tr>
          <td id="L144" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="144"></td>
          <td id="LC144" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L145" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="145"></td>
          <td id="LC145" class="blob-code blob-code-inner js-file-line">        rootPart.<span class="pl-smi">CFrame</span> <span class="pl-k">=</span> enabled.<span class="pl-smi">CFrame</span> <span class="pl-k">-</span> Vector3.<span class="pl-smi">yAxis</span> <span class="pl-k">*</span> <span class="pl-c1">20</span></td>
        </tr>
        <tr>
          <td id="L146" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="146"></td>
          <td id="LC146" class="blob-code blob-code-inner js-file-line">        rootPart.<span class="pl-smi">Anchored</span> <span class="pl-k">=</span> <span class="pl-c1">true</span></td>
        </tr>
        <tr>
          <td id="L147" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="147"></td>
          <td id="LC147" class="blob-code blob-code-inner js-file-line">        task.<span class="pl-c1">wait</span>(<span class="pl-c1">0.25</span>)</td>
        </tr>
        <tr>
          <td id="L148" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="148"></td>
          <td id="LC148" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">fireproximityprompt</span>(proximityPrompt, <span class="pl-c1">1</span>, <span class="pl-c1">true</span>)</td>
        </tr>
        <tr>
          <td id="L149" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="149"></td>
          <td id="LC149" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L150" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="150"></td>
          <td id="LC150" class="blob-code blob-code-inner js-file-line">        task.<span class="pl-c1">wait</span>(<span class="pl-c1">1.25</span>)</td>
        </tr>
        <tr>
          <td id="L151" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="151"></td>
          <td id="LC151" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L152" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="152"></td>
          <td id="LC152" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L153" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="153"></td>
          <td id="LC153" class="blob-code blob-code-inner js-file-line">    rootPart.<span class="pl-smi">Anchored</span> <span class="pl-k">=</span> <span class="pl-c1">false</span></td>
        </tr>
        <tr>
          <td id="L154" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="154"></td>
          <td id="LC154" class="blob-code blob-code-inner js-file-line">    rootPart.<span class="pl-smi">CFrame</span> <span class="pl-k">=</span> <span class="pl-c1">self</span>.<span class="pl-smi">startCFrame</span></td>
        </tr>
        <tr>
          <td id="L155" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="155"></td>
          <td id="LC155" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L156" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="156"></td>
          <td id="LC156" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">for</span> i,ownerDoor <span class="pl-k">in</span> <span class="pl-c1">pairs</span>(ownerDoors) <span class="pl-k">do</span></td>
        </tr>
        <tr>
          <td id="L157" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="157"></td>
          <td id="LC157" class="blob-code blob-code-inner js-file-line">        ownerDoor.<span class="pl-smi">Parent</span> <span class="pl-k">=</span> tycoon.<span class="pl-smi">Unlocks</span></td>
        </tr>
        <tr>
          <td id="L158" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="158"></td>
          <td id="LC158" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L159" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="159"></td>
          <td id="LC159" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
        </tr>
        <tr>
          <td id="L160" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="160"></td>
          <td id="LC160" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L161" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="161"></td>
          <td id="LC161" class="blob-code blob-code-inner js-file-line"><span class="pl-c"><span class="pl-c">--</span> Robber:RobTycoon( Robber:FindRobbableTycoon() )</span></td>
        </tr>
        <tr>
          <td id="L162" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="162"></td>
          <td id="LC162" class="blob-code blob-code-inner js-file-line">
</td>
        </tr>
        <tr>
          <td id="L163" class="blob-num js-line-number js-code-nav-line-number js-blob-rnum" data-line-number="163"></td>
          <td id="LC163" class="blob-code blob-code-inner js-file-line"><span class="pl-k">return</span> Robber</td>
        </tr>
  </table>
]], "highlight tab-size js-file-line-container js-code-nav-container js-tagsearch-file")

return Parser
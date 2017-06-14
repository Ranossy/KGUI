---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/DetectiveBase.lua
-- ����ʱ��:	2012-11-13 18:16:17
-- �����û�:	guozhaoxing
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/Include/String.lh")
Include("scripts/Include/DetectiveData.lua")

--���ڼ�¼�������ͷ��
tRoleIcon = {standard_male = "<T1460>", standard_female = "<T1477>", strong_male = "<T1478>", little_girl = "<T1459>"}

function Faceplate(playerID, npcID, nQuestID, nPhase, tTalk, nSentenceNum)
	if not nSentenceNum then
		nSentenceNum = 1
	end
	-- ��������洢�������
	local eTargetType, szString, eFaceplateType, nIconID, bFinish = 
		tTalk[nQuestID][nPhase][nSentenceNum][1], tTalk[nQuestID][nPhase][nSentenceNum][2], tTalk[nQuestID][nPhase][nSentenceNum][3], 
		tTalk[nQuestID][nPhase][nSentenceNum][4], tTalk[nQuestID][nPhase][nSentenceNum][6]
	local player = GetPlayer(playerID)
	local npc = GetNpc(npcID)
	if not (player and npc) then
		return
	end		
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if not nQuestIndex then
		return
	end
	-- �����������
	if bFinish == 1 and player.GetQuestValue(nQuestIndex, 0) == 0 then
		player.SetQuestValue(nQuestIndex, 0, 1)
	end
	-- szString������¼��ǰ������ɵ���״��
	local nStringLen = #szString
	local nRowLen = (10 - math.floor(nStringLen / 40)) * 14
	local szAddressor = ""
	local tButtonIcon = {"<T1461>", "<T$1462 5>", "<T$1463 9>", "<T$1464 10>", "<T1466>"}	--��׼��ť˳��Ϊ���հ�ť���عˡ����ʡ�����
	local tFaceStyle = {
		{1, 3, 4}, -- ���ʡ�����
		{2, 3, 4}, -- �عˡ����ʡ�����
		{2, 3, 1}, -- �عˡ�����
		{1, 3, 1}, -- ����
		{1, 1, 4}, -- ����
		{1, 1, 1}, -- 
		{2, 1, 4} -- �عˡ� �� ����
	}
	local tEvidence = {}
	local tButton = {}
	local speaker
	local szSpeakerName
	-- ˵�������Ϊ���
	if eTargetType == 1 then
		speaker = GetPlayer(playerID)
		if speaker then
			szSpeakerName = speaker.szName
		end
		-- ������ҽ�ɫѡ����ҵ�ͷ��
		if speaker.nRoleType == ROLE_TYPE.STANDARD_MALE then
			szAddressor = tRoleIcon.standard_male	--���ͷ��
		elseif speaker.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
			szAddressor = tRoleIcon.standard_female
		elseif speaker.nRoleType == ROLE_TYPE.STRONG_MALE then
			szAddressor = tRoleIcon.strong_male
		elseif speaker.nRoleType == ROLE_TYPE.LITTLE_GIRL then
			szAddressor = tRoleIcon.little_girl
		end
	-- ˵�������ΪĿ��NPC	
	elseif eTargetType == 2 then
		-- ��tList�и�������ѡ��npc��ͷ��
		for i = 1, #tList[nQuestID] do
			if npc.dwTemplateID == tList[nQuestID][i][1] then
				szAddressor = tList[nQuestID][i][2]
				break
			end
		end
		speaker = GetNpc(npcID)
		if speaker then
			local kTemplate = GetNpcTemplate(speaker.dwTemplateID)
			if kTemplate then
				szSpeakerName = kTemplate.szName
			end
		end
	end
	-- ȷ����ť���г�ʲô��ť
	for i = 1, 3 do
		local nIconIndex = tFaceStyle[eFaceplateType][i]
		tButton[i] = tButtonIcon[nIconIndex]
	end
	if nQuestIndex then
		-- nIconID������¼������ɵĲ��裬������ʾ����ȫ�����ʱΪ0
		if nIconID ~= 0 and not player.GetQuestBitValue(nQuestIndex, 2, nIconID - 1) then
			-- ����������������������������
			player.SetQuestBitValue(nQuestIndex, 2, nIconID - 1, 1)
			player.SendSystemMessage(GetEditorString(1, 2361))
		end
		-- ��¼�Ͼ�Ի��õ�������ͣ�������Index��
		player.SetQuestValue(nQuestIndex, 4, eFaceplateType)
		-- nItemAmount��¼������Ҫ�õ���ͼ������
		local nItemAmount = player.GetQuestValue(nQuestIndex, 1)
		for i = 1, 12 do
			if i <= nItemAmount then
				local bIsOpen = player.GetQuestBitValue(nQuestIndex, 2, i)
				if not bIsOpen then
					tEvidence[i] = tEvidenceIcon[nQuestID][#tEvidenceIcon[nQuestID] - 1]
				else
					tEvidence[i] = tEvidenceIcon[nQuestID][i]
				end
			else
				tEvidence[i] = tEvidenceIcon[nQuestID][#tEvidenceIcon[nQuestID]]
			end
		end
	end
	local szTitle = szAddressor .. "  <F188 " .. szSpeakerName .. ">:\n" ..
		"<H30><G>" .. szString .. "\n<H" .. nRowLen .. ">"
	local szButton = tButton[1] .. tButton[2] .. tButton[3] .. "\n"
	local szEvidence = tButtonIcon[5] .. "\n" .. tEvidence[1] .. tEvidence[2] .. tEvidence[3] .. tEvidence[4] .. tEvidence[5] .. tEvidence[6] .. "\n" ..
		tEvidence[7] .. tEvidence[8] .. tEvidence[9] .. tEvidence[10] .. tEvidence[11] .. tEvidence[12]
	if eFaceplateType == 5 then
		return szTitle .. szButton, GetMultiValue("ShowNewWindows" .. nQuestID, 3)
	elseif eFaceplateType == 6 then
		return szTitle, 0
	elseif eFaceplateType == 7 then 
		return szTitle .. szButton, GetMultiValue("ShowNewWindows" .. nQuestID, 3)
	else
		return szTitle .. szButton .. szEvidence, GetMultiValue("ShowNewWindows" .. nQuestID, 15)
	end
end

function ShowNewWindowsReload(player, eTargetType, nTargetID, nIndex, nQuestID, tTalk)
	local npc = GetNpc(nTargetID)
	if not npc then
		return
	end
	local npcNum
	for i = 1, #tList[nQuestID] do
		if npc.dwTemplateID == tList[nQuestID][i][1] then
			 npcNum = (i - 1) * 4
			 break
		end
	end 
	nIndex = nIndex + 1
	--��������ǵڼ�������
	local nLastSentence
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if not nQuestIndex then
		return
	end
	nLastSentence = player.GetQuestValue(nQuestIndex, 5)
	local eFaceplateType = player.GetQuestValue(nQuestIndex, 4)
	if eFaceplateType == 1 then
		nIndex = nIndex + 1
	elseif eFaceplateType == 3 and nIndex >= 3 then
		nIndex = nIndex + 1
	elseif eFaceplateType == 4 then
		if nIndex == 1 then
		nIndex = nIndex + 1
		elseif nIndex >= 2 then
			nIndex = nIndex + 2
		end
	elseif eFaceplateType == 5 then
		nIndex = nIndex + 2
	elseif eFaceplateType == 7 then
		if nIndex > 1 then
			nIndex = nIndex + 1
		end
	end

	--���洦��ͬ��Index���
	if nIndex == 1 then	--��ʱΪ�ع�
		local nPhase = math.floor(nLastSentence / 10)
		local nSentenceNum = nLastSentence % 10 - 1
		player.SetQuestValue(nQuestIndex, 5, nPhase * 10 + nSentenceNum)
		local nGrade = player.GetQuestValue(nQuestIndex, 3)
		if nGrade <= 10 then
			nGrade = 10
		end
		local nGameNum
		for i = 1, #tQuestList do
			if nQuestID == tQuestList[i] then
				nGameNum = i
			end
		end
		player.SetCustomUnsigned4(16 + nGameNum, nGrade - 1)
		player.SetQuestValue(nQuestIndex, 3, nGrade - 1)		
		return nPhase, nSentenceNum
	elseif nIndex == 3 then --��ʱΪ����
		if player.GetQuestValue(nQuestIndex, 7) == 1 then --����ָ֤�еļ���
			local nPhase = math.floor(nLastSentence / 10)
			local nSentenceNum = nLastSentence % 10
			player.SetQuestValue(nQuestIndex, 7, 0)
			return nPhase, nSentenceNum
		end
		local nPhase = math.floor(nLastSentence / 10)
		local nSentenceNum = nLastSentence % 10 + 1
		player.SetQuestValue(nQuestIndex, 5, nPhase * 10 + nSentenceNum)
		return nPhase, nSentenceNum
	else	--��ʱΪѯ�ʺ�ָ֤
		if nIndex >= 4 then	
			local nAnswerIndex = nIndex - 3
			for i = 1, nAnswerIndex do
				local bIsOpen = player.GetQuestBitValue(nQuestIndex, 2, i)
				if not bIsOpen then
					nIndex = nIndex + 1
				end
			end
		end
		local nPhase = math.floor(nLastSentence / 10)
		local nSentenceNum = nLastSentence % 10
		if nIndex == math.floor(tTalk[nQuestID][nPhase][nSentenceNum][5] / 100) then --ָ����ȷ���л����䡣
			nPhase = nPhase + 1
			local nStep = nPhase
			for i = 1, 4 do
				local bValue
				if nStep % 2 == 0 then
					bValue = false
				elseif nStep % 2 == 1 then
					bValue = true
				end
				player.SetQuestBitValue(nQuestIndex, 6, i + npcNum, bValue)
				nStep = math.floor(nStep / 2)
				if nStep == 0 then
					break
				end
			end
			nSentenceNum = 1
			player.SetQuestValue(nQuestIndex, 5, nPhase * 10 + nSentenceNum)
			return nPhase, nSentenceNum
		else	--ָ������
			local nGrade = player.GetQuestValue(nQuestIndex, 3)
			if nGrade <= 10 then
				nGrade = 10
			end
			local nGameNum
			for i = 1, #tQuestList do
				if nQuestID == tQuestList[i] then
					nGameNum = i
				end
			end
			player.SetCustomUnsigned4(16 + nGameNum, nGrade - 5)
			player.SetQuestValue(nQuestIndex, 3, nGrade - 5)
			player.SetQuestValue(nQuestIndex, 7, 1)
			return "wrong", 1
		end
	end
end

function GetPhase(player, npc, nQuestID)
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	local nPhase = 0
	if nQuestIndex then
		for i = 1, #tList[nQuestID] do
			if npc.dwTemplateID == tList[nQuestID][i][1] then
				for j = 1, 4 do
					local nValue = player.GetQuestBitValue(nQuestIndex, 6, j + (i - 1) * 4)
					if nValue then
						nPhase = 2 ^ (j - 1) + nPhase
					end
				end
				break
			end
		end
	end
	if nPhase == 0 then
		nPhase = 1
	end
	return nPhase
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
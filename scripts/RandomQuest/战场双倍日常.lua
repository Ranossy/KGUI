---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/ս��˫���ճ�.lua
-- ����ʱ��:	11/17/10 14:20:08
-- �����û�:	wangxinfeng1
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/Include/Player.lh")
Include("scripts/player/PlayerDeath.lua")
Include("scripts/RandomQuest/ͨ�������Ŷ�.lua")

function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)	
	local BF_TIME_LIST = { 
		[38] = 1, --��ũ�
		[48] = 2, --�Ź����
		[52] = 3, --70�ƺ����
		[50] = 4, --˿��֮·
	}
	local bDouble, nDouble = Get_BF_Double()
	if bDouble and BF_TIME_LIST[nDouble] then		
		return BF_TIME_LIST[nDouble]		
	end
	return  0
end
--local tActStrike_Quest = {
--7855, 7856, 7857, 7859, 
--}
function  CompleteDailyBattleQuest(player)	
	local tBattlefieldList = {
		[38] = true, -- ��ũ�
		[48] = true, -- �������
		[52] = true, -- �ƺ����
		[50] = true, -- ˿��֮·�������ţ�
		[135] = true, -- ������ս��
		[186] = true, -- ������
	}
	
	local scene = player.GetScene()
	if tBattlefieldList[scene.dwMapID] then
		local dwQuestID = 6010
		local nQuestPhase = player.GetQuestPhase(dwQuestID)
		local nQuestIndex = player.GetQuestIndex(dwQuestID)  
		if nQuestPhase == 1 and player.GetQuestValue(nQuestIndex, 0) == 0 then
			player.SetQuestValue(nQuestIndex, 0, 1) 
		end
		
		-- 2014.3.17Ԥ�Ȼ  ��Ӯ��ս��ʤ���ķ������������
		-- ����λ�ã�scripts/player/PlayerScript.lua 
		--if not player.GetBuff(7551, 1) then
			--player.AddBuff(0, 99, 7551, 1, 10)
		--end
	end
	--local nQuestIndex_Strike = nil--������ͻϮ���������ɽű�
	--for i = 1, #tActStrike_Quest do
	--nQuestIndex_Strike = player.GetQuestIndex(tActStrike_Quest[i])
	--if nQuestIndex_Strike then
	--player.SetQuestValue(nQuestIndex_Strike, 1, 1) 
	--end
	--end
	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
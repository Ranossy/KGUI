---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/ݶ������ɽ/skill/��������.lua
-- ����ʱ��:	12/01/10 16:41:58
-- �����û�:	yule-PC
-- �ű�˵��:	
----------------------------------------------------------------------<


-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Fx_AllPlayer(scene)
	if scene.nType ~= MAP_TYPE.DUNGEON then
		return false
	end
	local tTatget = {}
	local tPlayer = scene.GetAllPlayer()
	if tPlayer then
		for i = 1, #tPlayer do
			local cPlayer = GetPlayer(tPlayer[i])
			if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				tTatget[#tTatget + 1] = cPlayer
			end
		end
		if #tTatget == 0 then
			return false
		else
			return tTatget
		end
	end
end

function Apply(dwCharacterID) 
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		if not scene then
			return
		end
		local tPlayer = Fx_AllPlayer(scene)
		if tPlayer then
			for i = 1, #tPlayer do
				local cPlayer = tPlayer[i]
				if cPlayer then
					cPlayer.Die()
				end
			end
		end
		local npcBossA = scene.GetNpcByNickName("Boss_1_Man")
		local npcBossB = scene.GetNpcByNickName("Boss_1_Woman")
		local npcReferee = scene.GetNpcByNickName("Referee")
		local npcMainStory = scene.GetNpcByNickName("MainStory")
		if npcBossA then
			npcBossA.ClearAllThreat()
		end
		if npcBossB then
			npcBossB.ClearAllThreat()
		end
		if npcReferee then
			npcReferee.Yell(GetEditorString(3, 9042))
		end
		if npcMainStory then
			npcMainStory.FireAIEvent(2001, 1, 1)
		end
		
	end
end

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
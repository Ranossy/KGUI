---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/ݶ������ɽ/skill/��������.lua
-- ����ʱ��:	12/01/10 16:41:58
-- �����û�:	yule-PC
-- �ű�˵��:	
----------------------------------------------------------------------<


-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Fx_GetOut(npcTarget, npc, nSpace)
	local x, y = npc.nX, npc.nY
	local TargetX, TargetY, TargetZ = npcTarget.nX, npcTarget.nY, npcTarget.nZ
	local Npc_2D_X = TargetX - x
	local Npc_2D_Y = TargetY - y
	local Npc_Space = math.sqrt(Npc_2D_X ^ 2 + Npc_2D_Y ^ 2)
	if Npc_Space >= nSpace then
		return true
	else
		return false
	end
end

function Apply(dwCharacterID) 
	--[[
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		if not scene then
			return
		end
		
		local npcBossA = scene.GetNpcByNickName("Boss_1_Man")
		local npcBossB = scene.GetNpcByNickName("Boss_1_Woman")
		if npcBossA and npcBossB then
			if not Fx_GetOut(npcBossA, npcBossB, 10 * 64) then
				npcBossA.AddBuff(0, 99, 3089, 1)
				npcBossB.AddBuff(0, 99, 3089, 1)
			end
		end
	end
	--]]
end

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
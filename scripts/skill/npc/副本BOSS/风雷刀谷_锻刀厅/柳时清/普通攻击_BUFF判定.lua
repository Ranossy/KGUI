---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_�͵���/��ʱ��/��ͨ����_BUFF�ж�.lua
-- ����ʱ��:	2017/3/31 17:49:31
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local scene = npc.GetScene()
	local tTarget = {}
	if scene then
		local tPlayerList = scene.GetAllPlayer()
		if tPlayerList and #tPlayerList ~= 0 then
			for i = 1, #tPlayerList do
				local playertar = GetPlayer(tPlayerList[i])
				if playertar and playertar.nMoveState ~= MOVE_STATE.ON_DEATH then
					if playertar.GetBuff(11749, 1) then
						table.insert(tTarget, playertar.dwID)
					end
				end
			end
		end
		--print(#tTarget)
		if scene.dwMapID == 263 or scene.dwMapID == 273 then
			if tTarget then
				if #tTarget >= 2 then
					npc.CastSkill(17423, 1)
				else
					npc.CastSkill(17423, 2)
				end
			end
		else
			if tTarget then
				if #tTarget >= 2 then
					npc.CastSkill(17423, 3)
				else
					npc.CastSkill(17423, 4)
				end
			end
		end
	end

end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
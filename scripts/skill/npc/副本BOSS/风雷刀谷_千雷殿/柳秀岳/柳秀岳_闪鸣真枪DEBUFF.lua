---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/������/������_������ǹDEBUFF.lua
-- ����ʱ��:	2017/4/18 21:40:00
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("liuxiuyue")
	if not npc then
		return
	end

	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if player.GetBuff(11918, 1) then
			local Nbuff = player.GetBuff(11918, 1)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				npc.CastSkill(17627, 1, TARGET.PLAYER, player.dwID)
				player.DelGroupBuff(11918, 1)
			end
		end
	end

	if scene.dwMapID == 270 then
		if player.GetBuff(11918, 2) then
			local Nbuff = player.GetBuff(11918, 2)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				npc.CastSkill(17627, 2, TARGET.PLAYER, player.dwID)
				player.DelGroupBuff(11918, 2)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
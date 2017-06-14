---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/������/������_վ�����.lua
-- ����ʱ��:	2017/4/24 15:21:56
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
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH
		and player.nMoveState == MOVE_STATE.ON_STAND then
		if scene.dwMapID == 264 or scene.dwMapID == 272 then
			player.AddBuff(npc.dwID, npc.nLevel, 11910, 1)
		else
			player.AddBuff(npc.dwID, npc.nLevel, 11910, 2)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
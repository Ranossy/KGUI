---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/������/������_����DEBUFF.lua
-- ����ʱ��:	2017/5/9 16:23:40
-- �����û�:	ZHANGGUANYI
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
	local nRan = Random(10000)
	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if nRan <= 5000 then
			if not player.GetBuff(11909, 1) then
				player.Stop()
				player.AddBuff(npc.dwID, npc.nLevel, 11783, 1)
			end
		end
		npc.CastSkillXYZ(17607, 1, player.nX, player.nY, player.nZ)
	else
		if nRan <= 5000 then
			if not player.GetBuff(11909, 2) then
				player.Stop()
				player.AddBuff(npc.dwID, npc.nLevel, 11783, 2)
			end
		end
		npc.CastSkillXYZ(17607, 2, player.nX, player.nY, player.nZ)
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
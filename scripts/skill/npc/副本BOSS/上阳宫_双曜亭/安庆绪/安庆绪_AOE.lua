---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_˫��ͤ/������/������_AOE.lua
-- ����ʱ��:	2016/9/12 20:42:21
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
function Apply(dwCharacterID, dwSkillSrcID)
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)

end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	local scene = player.GetScene()
	if scene then
		local anqingxu = scene.GetNpcByNickName("anqingxu")
		if anqingxu and anqingxu.bFightState == true then
			anqingxu.CastSkill(16592, 1)
			anqingxu.PlaySfx(1471, player.nX, player.nY, player.nZ + 150)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
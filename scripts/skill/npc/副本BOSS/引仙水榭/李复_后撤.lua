---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/����ˮ�/�_��.lua
-- ����ʱ��:	2015/6/11 16:37:24
-- �����û�:	xueyan-pc
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{},
	{}
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_BACKWARD,
		16,
		70
	);

	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab

	----------------- ����������� ----------------------------------------

	--�����뾶��Ҳ���ǹ�������Ч����
	--skill.nMaxRadius        = 4 * LENGTH_BASE;
	--skill.nAngleRange       = 64;
	--����֡��
	skill.nPrepareFrames = 0;
	--�ӵ��ٶ�
	skill.nBulletVelocity = 0;
	--����ϵĸ���
	skill.nBreakRate = 1000;
	--Ӳֱ
	--skill.nStiffFrames		= 16

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	player.AcquireAchievement(702)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
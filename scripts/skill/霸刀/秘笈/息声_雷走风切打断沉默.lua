---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ե�/����/Ϣ��_���߷��д�ϳ�Ĭ.lua
-- ����ʱ��:	2016/9/7 21:14:15
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<
--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{
	{ CriticalPecent = 200},

};

--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local nRecipeLevel = SkillRecipeLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_CRITICAL_STRIKE_BASE_RATE,
		2000,
		0
		);
	
	skill.BindBuff(1, 11171, 2);		-- ����1��λBuff
	--skill.nBreakRate = 1024;	-- ���Ŀ��ʩ���ĸ���,����1024
	
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
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/����׷��.lua
-- ����ʱ��:	2013/4/30 10:33:26
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��������
-- ������    :  ֣����
-- ����ʱ��  :  20110908
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{	


};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
      
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PHYSICS_CRITICAL_STRIKE_BASE_RATE,
        22000, 
        0
		);
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PHYSICS_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,				
		200,
        0
		);
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PARRY_BASE_RATE,
        -10000, 
        0
		);
	
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
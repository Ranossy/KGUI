------------------------------------------------
-- �ļ���    :  ����-���ӻ���������˺�.lua
-- ������    :  �ź�	
-- ����ʱ��  :  2011-03-30
-- ��;(ģ��):  �书����
-- �书����  :  ͨ��
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ���ӻ���10%�����˺�20%
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	
	{ CriticalPecent = 1000},

};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local nRecipeLevel	= SkillRecipeLevel;
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PHYSICS_CRITICAL_STRIKE_BASE_RATE,
        tSkillRecipeData[nRecipeLevel].CriticalPecent, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SOLAR_CRITICAL_STRIKE_BASE_RATE,
        tSkillRecipeData[nRecipeLevel].CriticalPecent, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.NEUTRAL_CRITICAL_STRIKE_BASE_RATE,
        tSkillRecipeData[nRecipeLevel].CriticalPecent, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.LUNAR_CRITICAL_STRIKE_BASE_RATE,
        tSkillRecipeData[nRecipeLevel].CriticalPecent, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.POISON_CRITICAL_STRIKE_BASE_RATE,
        tSkillRecipeData[nRecipeLevel].CriticalPecent, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PHYSICS_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,				
				200,
        0
    );

		skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.MAGIC_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,				
				200,
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
------------------------------------------------
-- ������    :  ֣����
-- ����ʱ��  :  20111111
 
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{

};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
    
    ---��1����10�������ǻ���
    if skill.dwSkillID == 317 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3449,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 318 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3450,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 319 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3451,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 320 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3452,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 321 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3453,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 456 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3454,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 457 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3455,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 458 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3456,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 459 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3457,												
 		nRecipeLevel										
 		);
    end               
    if skill.dwSkillID == 460 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3458,												
 		nRecipeLevel										
 		);
    end       
    return
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
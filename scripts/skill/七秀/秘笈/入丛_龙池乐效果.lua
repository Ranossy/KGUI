------------------------------------------------
-- �ļ���    :  ����_���_������Ч��.lua
-- ������    :  �ź�
-- ����ʱ��  :  2011-04-06
------------------------------------------------


--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	
		{nBuffRecipeID = 82},
		{nBuffRecipeID = 83},
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
    local dwSkillLevel = skill.dwLevel;	

	if nRecipeLevel == 1 then 
	
   	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CALL_BUFF,								
 		3459,												
 		dwSkillLevel										
 		);
		
		skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
		"skill/����/����/�����ּ���1.lua",				-- ����ֵ1
		0														-- ����ֵ2
		);
	end
	
 	if nRecipeLevel == 2 then 
 		

 		
		skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
		"skill/����/����/�����ּ���2.lua",				-- ����ֵ1
		0														-- ����ֵ2
		);
	end
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
------------------------------------------------
-- �ļ���    :  ����ϵ_���ٺ󷭼��ܵ�CD.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2009-6-6
-- ��;(ģ��):  �书����
-- �书����  :  
-- �书����  : 
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ����ϵ_���ٺ󷭼��ܵ�CD
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����ϵ/����ϵ_���ٺ󷭼��ܵ�CD.lua",
		0
	);
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID);
	local dwSkillLevel = player.GetSkillLevel(89);
	if dwSkillLevel >0 then
		player.AddSkillRecipe(1306,dwSkillLevel);
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID);
	local dwSkillLevel = player.GetSkillLevel(89);
	for i = 1, 10 do 
		if player.IsSkillRecipeExist(1306,i) then
			player.DelSkillRecipe(1306,i);
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
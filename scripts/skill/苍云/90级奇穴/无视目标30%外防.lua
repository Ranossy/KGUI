---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/����Ŀ��30%���.lua
-- ����ʱ��:	2015/9/25 9:18:10
-- �����û�:	mengxiangfei11
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	if skill.dwSkillID == 13110  or skill.dwSkillID == 13107 or skill.dwSkillID == 13108 or skill.dwSkillID == 13106 or
	   skill.dwSkillID == 13160  or skill.dwSkillID == 13099 or skill.dwSkillID == 13156 or skill.dwSkillID == 13100 or
	   skill.dwSkillID == 13075  or skill.dwSkillID == 13076 or skill.dwSkillID == 13077 or skill.dwSkillID == 13078 or
	   skill.dwSkillID == 13079  or skill.dwSkillID == 13080 or skill.dwSkillID == 13081 or skill.dwSkillID == 13082 or
	   skill.dwSkillID == 13083  or skill.dwSkillID == 13084 or skill.dwSkillID == 13085 or skill.dwSkillID == 13092 or
	   skill.dwSkillID == 13093  or skill.dwSkillID == 13463 or skill.dwSkillID == 13464 or skill.dwSkillID == 13206 or
	   skill.dwSkillID == 13044  or skill.dwSkillID == 13244 or skill.dwSkillID == 13060 or skill.dwSkillID == 13119 or
	   skill.dwSkillID == 13164  or skill.dwSkillID == 13453 or skill.dwSkillID == 13052 or skill.dwSkillID == 13276 or
		skill.dwSkillID == 13161  or skill.dwSkillID == 13045 then
     	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PHYSICS_SHIELD_PERCENT,
        -512, 
        0
		);
		end
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
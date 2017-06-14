---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_������_Х�绢.lua
-- ����ʱ��:	2013/5/28 22:36:10
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_������_Х�绢.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-5
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  Х�绢
-- ����Ч��  :  ����⹦������,����⹦������,����⹦����ֵ,����Ч��.30%Ѫ����
------------------------------------------------
--08��8��29��:�޸Ľű�,�ϲ�Ч��,ֻʩ��Х�绢_��Ѫս�� ID=446,���Х�绢����Ч��
--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 19, nBuffLevel = 1}, -- Level 1
	{nCostMana = 24, nBuffLevel = 2}, -- Level 2
	{nCostMana = 30, nBuffLevel = 3}, -- Level 3
	{nCostMana = 35, nBuffLevel = 4}, -- Level 4
	{nCostMana = 40, nBuffLevel = 5}, -- Level 5
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	

	--ʩ�� Х�绢_��Ѫս�� ID=446
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		446,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/���/���_������_Х�绢.lua",
		0
	);
	--ʩ�� Х�绢_��Ѫս��_�����γ۳� 
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1226,
		1
	);--]]

--08��8��29��ע��. 
--	--ʩ�� Х�绢_������ ID=447
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		447,
--		dwSkillLevel
--	);

		

	----------------- ����CoolDown ---------------------------------------------------------------------
	skill.AddSlowCheckSelfBuff(9933, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD
	skill.SetNormalCoolDown(1, 100);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 46;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
  	----------------- ����Ѫ������ ---------------------------------------------
	skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	skill.nSelfLifePercentMax	= 40;				-- Ѫ�����ֵ<=
	--------------------------------------------
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
    
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local dwPlayerLife = player.nCurrentLife;
	local dwPlayerMaxLife = player.nMaxLife;
    --[[
	if dwPlayerLife < dwPlayerMaxLife * 0.3 then
	else
		return false;
	end
    --]]
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(42)
	end
end

--������ħ������Ӧ��ʱ��ִ�нű�,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--ѣ��Ч��
	if player.GetSkillLevel(5697) == 1 then
		player.CastSkill(6516, 1)
	end
end

--������ħ�����Է�Ӧ��ʱ��ִ�нű�,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)

end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����﷨_����ͻ.lua
-- ����ʱ��:	2013/4/17 17:06:46
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�����﷨_����ͻ.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-06
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  �����﷨
-- ��������  :  ����ͻ
-- ����Ч��  :  ����ӱ�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 23, nBuffID = 204, nBuffLevel = 1}, -- Level 1
	{nCostMana = 28, nBuffID = 204, nBuffLevel = 2}, -- Level 2
	{nCostMana = 34, nBuffID = 204, nBuffLevel = 3}, -- Level 3
	{nCostMana = 39, nBuffID = 204, nBuffLevel = 4}, -- Level 4
	{nCostMana = 45, nBuffID = 204, nBuffLevel = 5}, -- Level 5

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_�����﷨_����ͻ.lua", -- ����ֵ1
		0														-- ����ֵ2
		);
	
	--[[
	skill.AddAttribute(
		 ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		 ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		 1104, 
		 dwSkillLevel
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		108,											
		0											
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		103,											
		0											
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		105,											
		0											
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		189,											
		0											
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		436,											
		0											
	);
	--print(1111)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		104,											
		0											
	);								
	skill.BindBuff(1, 204, tSkillData[dwSkillLevel].nBuffLevel);	-- ����Buff

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 102); 
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 243;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
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
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(5677) == 1 then
		player.CastSkill(6067, 1)
	end
	
	ModityCDToUI(player, 425, 0, 0)
	player.SetTimer(1, "scripts/skill/���/���_�����﷨_����ͻ.lua", 0, 0)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	ModityCDToUI(player, 433, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
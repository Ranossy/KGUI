---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��彣ʽ_������ɽ_�˺�.lua
-- ����ʱ��:	2013/5/29 20:23:16
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_������ɽ.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-03-2
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��彣ʽ
-- ��������  :  ������ɽ
-- ����Ч��  :  ������ɽ����ɽ���磬��ľ�Է�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 108, 	nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 124, 	nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 140, 	nDamageRand = 5}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 156, 	nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 172, 	nDamageRand = 6}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 188, 	nDamageRand = 7}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 204, 	nDamageRand = 8}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 220, 	nDamageRand = 9}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 236, 	nDamageRand = 9}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 252, 	nDamageRand = 10}, -- Level 10 
};           

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;



	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/2,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/�ؽ�_��彣ʽ_������ɽ_�˺�.lua", -- ����ֵ1
		0														-- ����ֵ2
	);  
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 343);
	skill.AddCheckSelfLearntSkill(6543, 0, SKILL_COMPARE_FLAG.EQUAL);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 80;
	elseif dwSkillLevel < 10 then
		skill.nChannelInterval =80 + (dwSkillLevel - 5) *15
	else
		skill.nChannelInterval = 160;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 160; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 80;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 6 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 2048;
	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
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
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetSkillLevel(6548) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6148, 1, 1)
		player.nCurrentRage = player.nCurrentRage + 5
	end

	if player.GetSkillLevel(6542) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9713, 1)
	end

	--�ؽ��糵��ħ
	if player.GetSkillLevel(9292) == 1 then
		if player.GetBuff(10104, 6) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 7)
		elseif player.GetBuff(10104, 5) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 6)
		elseif player.GetBuff(10104, 4) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 5)
		elseif player.GetBuff(10104, 3) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 4)
		elseif player.GetBuff(10104, 2) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 3)
		elseif player.GetBuff(10104, 1) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 2)
		else
			player.AddBuff(player.dwID, player.nLevel, 10103, 1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
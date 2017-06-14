---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/������_��̫��.lua
-- ����ʱ��:	2013/4/22 21:16:03
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ������_��̫��.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  ��̫��
-- ����Ч��  :  ����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Include/Math.lh")

tSkillData = 
{
	{ nDamageBase = 15, nDamageRand = 0, nCostMana = 71}, --level 1
	{ nDamageBase = 18, nDamageRand = 0, nCostMana = 88}, --level 2
	{ nDamageBase = 21, nDamageRand = 0, nCostMana = 105}, --level 3
	{ nDamageBase = 25, nDamageRand = 0, nCostMana = 121}, --level 4
	{ nDamageBase = 28, nDamageRand = 0, nCostMana = 138}, --level 5
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ ------------------------------------------------- 		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/������_��̫��.lua", --����ֵ1
		0															--����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/90����Ѩ/����ͨ��˲��.lua", -- ����ֵ1
		0															-- ����ֵ2
	);
--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL, -- ħ������
		315, -- ����ֵ1
		1															-- ����ֵ2
	);
  --]]  
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 242);		-- 6��CD
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana * 0.7;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	skill.nCostManaBasePercent = 120;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nMinPrepareFrames  	= 1;
	skill.nPrepareFrames = 16;					-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;		-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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
	local player = nil
	local scene = nil
	local npc = nil
	local dwSkillLevel = nil
	
	player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	scene = player.GetScene()
	if not scene then
		return
	end

	local nSkill = player.GetKungfuMount()
	dwSkillLevel = 5
	if player.GetSkillLevel(14829) == 1 then
		npc = scene.CreateGas(
			dwCharacterID, 4979, 624, 3574,
			621, dwSkillLevel, 0, 3139, dwSkillLevel, 0, true,
			160, 1, 24, 0, 0, 0, false,
			9954, 1, 0, 0, 0, 0, false,
			0, 0, 0, 0, 0, 0, false,
			332, dwSkillLevel, false,
			0, 0, false,
			14991, 1, false,
		0, 0, false)		
	else
		npc = scene.CreateGas(
			dwCharacterID, 4979, 384, 3574,
			621, dwSkillLevel, 0, 3139, dwSkillLevel, 0, true,
			160, 1, 24, 0, 0, 0, false,
			0, 0, 0, 0, 0, 0, false,
			0, 0, 0, 0, 0, 0, false,
			332, dwSkillLevel, false,
			0, 0, false,
			0, 0, false,
		0, 0, false)
	end
	--��������������
	player.CastSkill(315,1)
	if npc then
		npc.AddBuff(0, 99, 108, 1, 100)
		--������ħ����AOE
		if player.GetSkillLevel(9352) == 1 and nSkill ~= nil and nSkill.dwSkillID == 10015 then
			if player.GetSkillLevel(14829) == 1 then
				npc.AddBuff(player.dwID, player.nLevel, 8098, 1, 12)
			else
				npc.AddBuff(player.dwID, player.nLevel, 8098, 1, 8)
			end
		end
		player.SetTimer(45, "scripts/skill/����/������_��̫��.lua", npc.dwID, 0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)				-- һ��ʱ�����Ч
	local npc = GetNpc(nParam1)
	if npc and not npc.GetCustomBoolean(0) then
		npc.SetModelID(3849)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/������_��ɽ��.lua
-- ����ʱ��:	2013/6/21 21:36:30
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ������_��ɽ��.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  ��ɽ��
-- ����Ч��  :  �޵�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Include/Math.lh")

tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 349}, --level 1
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--�������������ض�
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC, -- ħ������
		315, -- ����ֵ1
		1															-- ����ֵ2
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_BUFF, -- ħ������
		3851, -- ����ֵ1
		1															-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/90����Ѩ/����ͨ��˲��.lua", -- ����ֵ1
		0															-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/������_��ɽ��.lua", -- ����ֵ1
		0															-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC, -- ħ������
		706, -- ����ֵ1
		1															-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2903,
		1
	);

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
	--skill.SetPublicCoolDown(16);
	--skill.SetNormalCoolDown(1, 170);
	skill.SetNormalCoolDown(1, 174);
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
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
	skill.nPrepareFrames = 0;					-- ����֡��
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
	if player.GetSkillLevel(5844) ~= 1 then
		return nPreResult;
	else
		return false
	end
end


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)

	local player = GetPlayer(dwCharacterID)
	local player = nil
	local scene = nil
	local npc = nil
	local dwSkillLevel = nil
	local npc2 = nil
	
	player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	scene = player.GetScene()
	if not scene then
		return
	end
	
	dwSkillLevel = player.GetSkillLevel(359)
	
	if player.GetSkillLevel(6904) == 1 then
		npc = scene.CreateGas(
			dwCharacterID, 4982, 128, 3574,
			620, 2, 0, 0, 0, 0, false,
			160, 1, 0, 0, 0, 0, false,
			0, 0, 0, 0, 0, 0, false,
			0, 0, 0, 0, 0, 0, false,
			15135, 1, true,
			706, 1, true,
			0, 0, false,
			0, 0, false)	
	else
		npc = scene.CreateGas(
			dwCharacterID, 4982, 128, 3574,
			620, 1, 0, 0, 0, 0, false,
			160, 1, 0, 0, 0, 0, false,
			0, 0, 0, 0, 0, 0, false,
			0, 0, 0, 0, 0, 0, false,
			326, 1, true,
			706, 1, true,
			0, 0, false,
			0, 0, false)
	end
	
	--���ⶪ�յسԲ���1���޵�,��1�οء�
	player.AddBuff(player.dwID, player.nLevel, 377, 1)
	player.CastSkillXYZ(706, 1, player.nX, player.nY, player.nZ)
	player.CastSkillXYZ(2903, 1, player.nX, player.nY, player.nZ)
	
	if npc then
		npc.AddBuff(0, 99, 108, 1, 100)
		player.SetTimer(45, "scripts/skill/����/������_��ɽ��.lua", npc.dwID, 0)
		
		npc2 = scene.CreateNpc(5071, npc.nX, npc.nY, npc.nZ, 0, 16 * 8)
		npc2.SetModelID(3574)
	end
	if player.GetSkillLevel(5844) == 1 then
		player.nCurrentLife = player.nCurrentLife
	end
	if player.GetSkillLevel(5845) == 1 then
		--player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.2
		player.AddBuff(dwCharacterID, player.nLevel, 6104, 1, 1)
	end

	if player.GetSkillLevel(5844) == 1 then
		ModityCDToUI(player, 6911, 0, 0)
	else
		ModityCDToUI(player, 371, 0, 0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)				-- һ��ʱ�����Ч
	local npc = GetNpc(nParam1)
	if npc then
		npc.SetModelID(3852)
	end

	npc = GetNpc(nParam2)
	if npc then
		npc.SetModelID(3915)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
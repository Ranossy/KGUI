---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��������_��ĸ����.lua
-- ����ʱ��:	2015/11/2 14:29:09
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_��������_��ĸ����.lua
-- ������    :  ���
-- ����ʱ��  :  2008-08-20
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :
-- �书��·  :  ��������
-- ��������  :  ��ĸ����
-- ����Ч��  :  Զ�̴������ƣ���Ҫ����״̬
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 530 * 0.95, nTherapyRand = 530 * 0.1, nCostMana = 115 }, -- level 1
	{nTherapy = 662 * 0.95, nTherapyRand = 662 * 0.1, nCostMana = 166 }, -- level 2
	{nTherapy = 795 * 0.95, nTherapyRand = 795 * 0.1, nCostMana = 205 }, -- level 3
	{nTherapy = 927 * 0.95, nTherapyRand = 927 * 0.1, nCostMana = 243 }, -- level 4
	{nTherapy = 1060 * 0.95, nTherapyRand = 1060 * 0.1, nCostMana = 282 }, -- level 5
	{nTherapy = 1192 * 0.95, nTherapyRand = 1192 * 0.1, nCostMana = 321 }, -- level 6
	{nTherapy = 1325 * 0.95, nTherapyRand = 1325 * 0.1, nCostMana = 359 }, -- level 7
	{nTherapy = 1457 * 0.95, nTherapyRand = 1457 * 0.1, nCostMana = 398 }, -- level 8
	{nTherapy = 1623 * 0.95, nTherapyRand = 1623 * 0.1, nCostMana = 398 }, -- level 9
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

 ----------------- ħ������ -------------------------------------------------
 ---- ���������󷨵�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		530,
		1
	);

 -- skill.AddAttribute(
 -- ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
 -- ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
 -- 2976,
 -- dwSkillLevel
 -- );
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/��������_��ĸ����.lua", -- ����ֵ1
		0 -- ����ֵ2
	);
 -- for i = 1, 3 do
 -- skill.AddAttribute(
 -- ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
 -- ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
 -- "skill/����/�����ķ�_ȥ������.lua",
 -- 0
 -- );
 -- skill.AddAttribute(
 -- ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
 -- ATTRIBUTE_TYPE.ACCUMULATE, -- ħ������
 --- 1, -- ����ֵ1
 -- 0														-- ����ֵ2
 -- );

 -- skill.AddAttribute(														--70���似��
 -- ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
 -- ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
 -- 6213,
 -- 1
 -- );

 -- end

 ----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL); -- ��������Buff
 -- skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

 ----------------- BUFF��� -------------------------------------------------
 -- skill.BindBuff(1, 126, 1)			-- ����Buff  dwSkillLevel��ע����ȼ�һ��
 -- skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
 -- skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
 -- skill.BindBuff(1, 592, 1);				-- ����Hot

 ----------------- ����Cool down --------------------------------------------
 -- CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16); -- ����CD1.5��
	skill.SetNormalCoolDown(2, 188); -- ����CD15��
	skill.SetCheckCoolDown(1, 444);
 ----------------- ����������� ---------------------------------------------
 -- ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
 -- skill.dwLevelUpExp	= 0;    				-- ��������
 -- skill.nExpAddOdds		= 1024;					-- ������������������
 -- skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

 ----------------- �������� -------------------------------------------------
 -- skill.nCostLife		= 0;					-- ������������ֵ
 -- skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�������ע������ܵȼ�һ��
 -- skill.nCostRage		= 0;					-- �������ĵ�ŭ��
 -- skill.nCostStamina	= 0;					-- �������ĵ�����
 -- skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
 -- skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 539 * 0.8 * 0.2; -- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 539 * 0.8 * 0.4; -- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 539 * 0.8 * 0.6; -- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 539 * 0.8 * 0.8; -- �������ĵ�����
	else
		skill.nCostManaBasePercent = 539 * 0.8; -- �������ĵ�����
	end
 ----------------- ������� -------------------------------------------------
 -- skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
 -- skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

 ----------------- ��״������� ---------------------------------------------
 -- skill.nChainBranch	= 1;					--��״���ܷ�֧��
 -- skill.nChainDepth		= 3;					--��״���ܲ���
 -- ��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

 ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0; -- ����ʩ�ŵ���С����
	skill.nMaxRadius = 20 * LENGTH_BASE; -- ����ʩ�ŵ�������

 ----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256; -- ������Χ�����νǶȷ�Χ
 -- skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶
 -- skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

 ----------------- ʱ����� -------------------------------------------------
 -- skill.nPrepareFrames  	= 48;				-- ����֡��
	skill.nChannelInterval = 150; -- ͨ�������ʱ��
 -- skill.nChannelFrame		= 48;	 			-- ͨ��������ʱ�䣬��λ֡��
 -- skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

 ----------------- ����� -------------------------------------------------
 -- skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
 -- skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
 -- skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

 ----------------- ������ -------------------------------------------------
 -- skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
 -- skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024

 ----------------- �����˺���� ---------------------------------------------
 -- nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult) -- �ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.GetBuff(1383, 2) then
		return nPreResult;
	end
	local nLevel = player.GetSkillLevel(537)
	if player.GetBuff(409, nLevel) then
		local	nBuff = player.GetBuff(409, nLevel)
		local   stackNum = nBuff.nStackNum
		if stackNum < 4  then
			return false
		end
	end
	if player.GetBuff(409, nLevel + 7) then
		local	nBuff = player.GetBuff(409, nLevel + 7)
		local   stackNum = nBuff.nStackNum
		if stackNum < 4  then
			return false
		end
	end
	if player.GetBuff(409, nLevel + 14) then
		local	nBuff = player.GetBuff(409, nLevel + 14)
		local   stackNum = nBuff.nStackNum
		if stackNum < 4  then
			return false
		end
	end

	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local lv = player.GetSkillLevel(569)
	if player.GetSkillLevel(14730) == 1 and target.nCurrentLife <= target.nMaxLife * 0.4 and not player.GetBuff(9784, 1) then
		player.ClearCDTime(188)
		player.ClearCDTime(441)
		player.SetTimer(2, "scripts/skill/����/��������_��ĸ����.lua", 0, 0)
		player.AddBuff(player.dwID, player.nLevel, 9784, 1)
	end
	if player.GetSkillLevel(5875) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5794, 1, 1)
		player.CastSkillXYZ(6209, lv, target.nX, target.nY, target.nZ)
		player.PlaySfx(485, target.nX, target.nY, target.nZ + 500)
	end
	if player.GetSkillLevel(5881) == 1 then
		player.CastSkill(2931, 1)
	end
 -- if player.GetSkillLevel(5874) == 1 then
	if IsPlayer(dwCharacterID) then
		if player.GetSkillLevel(5874) == 1 then
			if target.nCurrentLife > target.nMaxLife * 0.4 then
				player.CastSkill(2976, lv, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(2977, lv, TARGET.PLAYER, dwCharacterID)
			end
		else
			player.CastSkill(2976, lv, TARGET.PLAYER, dwCharacterID)
		end
	else
		if player.GetSkillLevel(5874) == 1 then
			if target.nCurrentLife > target.nMaxLife * 0.4 then
				player.CastSkill(2976, lv, TARGET.NPC, dwCharacterID)
			else
				player.CastSkill(2977, lv, TARGET.NPC, dwCharacterID)
			end
		else
			player.CastSkill(2976, lv, TARGET.NPC, dwCharacterID)
		end
	end

 -- ��ĸ������Ѫֵ����35%Ŀ���������ü��ܵ�Ϣ
 	--[[
	if player.GetSkillLevel(14730) == 1 and target.nCurrentLife <= target.nMaxLife * 0.35 and not player.GetBuff(9784, 1) then
		player.ClearCDTime(188)
		player.ClearCDTime(441)
		player.AddBuff(player.dwID, player.nLevel, 9784, 1)
	end
	--]]
	ModityCDToUI(player, 569, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	player.ClearCDTime(188)
	player.ClearCDTime(441)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
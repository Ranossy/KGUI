---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/���Ӻ���.lua
-- ����ʱ��:	2017/2/17 17:09:15
-- �����û�:	DELL01505071721
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL, -- ħ������
		16845, -- ����ֵ1
		dwSkillLevel											-- ����ֵ2
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/npc/����BOSS/���ֺ���/���Ӻ���.lua", -- ����ֵ1
		0											-- ����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------

	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	-----------------����ʩ����̬����(����)----------------------------------------
	--skill.nNeedPoseState = 1    --�����̬��1Ϊ�浶��̬��2Ϊ�����̬

	----------------�����˺���С�ӻ�Ѫ------------------------------------------

	--skill.nDamageToLifeForParty = 0	--�����˺���С�ӳ�Ա�ٷֱȻ�Ѫ

	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 1136);	--������ͨCD
	--skill.SetCheckCoolDown(1, 444);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	--skill.nCostManaBasePercent = 0;							-- �������ĵ������ٷֱ�
	--skill.nCostSunEnergy = 10;							-- �������ĵ�������
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- ����Ϊtrueʱ,��ʾȫ�����Ķ���
	--skill.nNeedAccumulateCount = 0;				-- ������Ҫ����ĸ�������skill.bIsAccumulate	= trueʱ��Ч
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 100 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	--------------------�������ò���----------------------------------------------
	--skill.nSkillBulletType = 1;					--�ӵ�����(����Ϊ1���Ե�Ϊ3)
	--skill.nSkillBulletSubType = 0;				--�ӵ���������,(��BulletTypeһ��ȷ����ͬ�ӵ��Ĳ�ͬ���֣�ȡֵ��Χ0~256)
	--skill.nAnimationPlayFrame = 0 				--�ӳ���ʧ֡�������Ϊ�����ӵ��󶯻��ȴ�ʱ��,�����ӵ���Ŀ�꿪ʼ����,��ô��֮֡��,����sbsEnd��Ϣ������.
	--skill.nMaxHitCount = 1						--���似�ܵ���󹥻�����
	--skill.nMaxHitRadius = 1 * 64					--�����ͷ��ߵ��������޶�
	--skill.nMaxHoodleRadius = 10 * LENGTH_BASE  	--������������
	--skill.nMaxSearchCount = 1 					--�Ƿ����Ƶ���Ŀ��(0Ϊ���� 1Ϊֻ��һ��Ŀ��)
	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit	= 1;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
	--skill.bInstantChannel = false;				-- ͨ�������Ƿ��������һ���˺�
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end


function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local npc=GetNpc(dwSkillSrcID)
	if not player then
		return
	end
	if not npc then
		return
	end

	local x = npc.GetCustomInteger4(4)
	local y = npc.GetCustomInteger4(8)
	local z = npc.GetCustomInteger4(12)
	local currentFaceDir=npc.nFaceDirection
	local sfxdir
	--��AI���õı�����ȡ������ֵ
	local fix_X, fix_Y = GetDestinationPoint(x, y, currentFaceDir, -80)
	--λ����������ֵ���Գ����ģ�������10�׳���ǽ��
	local Sou_X, Sou_Y, Dex_X, Dex_Y = NewDaoQiang(fix_X, fix_Y, currentFaceDir, 10 * 64)
	--��������λ�ã�Ŀǰ��Ŀ��λ�ã��ͷ���Ŀǰ���ͷż���NPC���򣩼��㵶ǽ����յ�
	
	player.AddAdvancedDynamicObstacle(Sou_X, Sou_Y, Dex_X, Dex_Y, z - 2 * 64 * 8, z + 8 * 64 * 8, 128, ADVANCED_DYNAMIC_OBSTACLE_TYPE.ENEMY_PARTY)--96λ
	--���ϸ������������λ�÷��ö�̬�ϰ�
	
	if currentFaceDir < 64 then
		sfxdir = currentFaceDir + 256 - 64
	else
		sfxdir=currentFaceDir-64
	end
	
	player.PlaySfx(8684, Sou_X, Sou_Y, z,sfxdir * 360 / 256 + 360/256)
	--npc.SetCustomInteger4(4,0)
	--npc.SetCustomInteger4(8,0)
	--npc.SetCustomInteger4(12,0)
	print(x)
	print(y)
	print(z)
	
end
function NewDaoQiang(nX, nY, nDir, nLength)
	local Sou_X
	local Sou_Y
	local Dex_X
	local Dex_Y
	local Sou_dir = nDir + 60
	local Des_dir = nDir - 60
	local Sou_Dir_x
	local Sou_Dir_y
	local Des_Dir_x
	local Des_Dir_y

	if Sou_dir > 256 then
		Sou_dir = Sou_dir - 256
	end

	if Des_dir < 0 then
		Des_dir = Des_dir + 256
	end
	
	if Sou_dir > 64 and Sou_dir < 128 then
		Sou_Dir_x = Sou_dir
		Sou_Dir_y = 128 - Sou_dir
	elseif Sou_dir >= 128 and Sou_dir < 192 then
		Sou_Dir_x = 256 - Sou_dir
		Sou_Dir_y = 128 - Sou_dir
	elseif Sou_dir <= 256 and Sou_dir >= 192 then 
		--nDir = nDir - 256----
		Sou_Dir_x = 256 - Sou_dir
		Sou_Dir_y = Sou_dir - 256
	else
		Sou_Dir_x = Sou_dir
		Sou_Dir_y = Sou_dir 
	end

	if Des_dir > 64 and Des_dir < 128 then
		Des_Dir_x = Des_dir
		Des_Dir_y = 128 - Des_dir
	elseif Des_dir >= 128 and Des_dir < 192 then
		Des_Dir_x = 256 - Des_dir
		Des_Dir_y = 128 - Des_dir
	elseif Des_dir <= 256 and Des_dir >= 192 then 
		--nDir = nDir - 256----
		Des_Dir_x = 256 - Des_dir
		Des_Dir_y = Des_dir - 256
	else
		Des_Dir_x = Des_dir
		Des_Dir_y = Des_dir
	end

	Sou_X = nX + math.cos(math.rad(Sou_Dir_x * 360 / 256)) * nLength
	Sou_Y = nY + math.sin(math.rad(Sou_Dir_y * 360 / 256)) * nLength
	
	Dex_X = nX + math.cos(math.rad(Des_Dir_x * 360 / 256)) * nLength
	Dex_Y = nY + math.sin(math.rad(Des_Dir_y * 360 / 256)) * nLength
	
	return Sou_X, Sou_Y, Dex_X, Dex_Y
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2011-10-18
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
   	
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/����/����_����_����.lua",								--����ֵ1
   		0															--����ֵ2
   	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(10130, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    --skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
    --skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
    --skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
      skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
      skill.SetNormalCoolDown(1, 488);	--������ͨCD
      skill.SetCheckCoolDown(1, 444);	--ֻ��鲻�ߵ�CD
   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
  	skill.nCostEnergy		= 20;							-- �������ĵ�����
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
    --skill.nCostStamina	= 0;									-- �������ĵ�����
    --skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	  skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	  skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	  skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 10 * LENGTH_BASE;		-- �������ð뾶 
     --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 24;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
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
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local battery = player.GetBattery()
	if not battery or battery.dwTemplateID == 16174 or battery.dwTemplateID == 16177 then
		player.SendSystemMessage(GetEditorString(3, 9054))
		return false
	end
	local nDistance = GetCharacterDistance(player.dwID, battery.dwID)
	if nDistance > 4 * LENGTH_BASE then
		return false
	end
    return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		cPlayer.CastSkill(3626,1)
		return
	end
	local cNpc = GetNpc(cPlayer.dwBatteryID)
	if not cNpc then
		cPlayer.CastSkill(3626,1)
		return
	end
	local scene = cPlayer.GetScene()
	if not scene then
		return
	end
	local PI = 3.1416;
	local nAngel = PI / 2;
	local nR = 100;
	local nDir = cNpc.nFaceDirection;
	local dwAngel = (cNpc.nFaceDirection * 1.4 - 90) / 180 * PI + nAngel;
	local nCX = cNpc.nX - nR * math.cos(dwAngel);
	local nCY = cNpc.nY - nR * math.sin(dwAngel);
	local nResaultA = cPlayer.CastSkillXYZ(3638,1,nCX,nCY,cNpc.nZ)	--������̨�����Ƿ�ɴ�
	local nRX, nRY, nRZ = scene.GetInterceptPoint(nCX,nCY,cNpc.nZ + 1024,cPlayer.nX, cPlayer.nY, cPlayer.nZ + 1024)

	local nResaultB = cPlayer.CastSkill(3625, 1, TARGET.NPC, cNpc.dwID)	--������̨λ���Ƿ�ɴ�
	local cRX, cRY, cRZ = scene.GetInterceptPoint(cNpc.nX, cNpc.nY, cNpc.nZ + 1024, cPlayer.nX, cPlayer.nY, cPlayer.nZ + 1024)
	
	if nResaultB ~= 1 or cRX ~= 0 or cRY ~= 0 or cRZ ~= 0 then			--�ͷ�ʧ�ܺ󲹳�
		cPlayer.ClearCDTime(488)
		cPlayer.ClearCDTime(16)
		cPlayer.nCurrentEnergy = cPlayer.nCurrentEnergy + 20
		cPlayer.SendSystemMessage(GetEditorString(3, 9054))		
		return
	end 
	if nResaultA == 1 and nRX == 0 and nRY ==0 and nRZ ==0 then		--��3D�ϰ��ɴ������̨����
		cPlayer.Stop()
		--cPlayer.TurnTo(cNpc.nFaceDirection)
		cPlayer.TurnToCharacter(cNpc.dwID)
		cPlayer.SetPosition(nCX, nCY, cNpc.nZ)
		--cPlayer.TurnTo(cNpc.nFaceDirection)
		cPlayer.TurnToCharacter(cNpc.dwID)
		cPlayer.SetTimer(16, "scripts/skill/����/����_�Ӽ���.lua", cNpc.dwID, 0)
		--cPlayer.CastSkill(3398,1)
		cPlayer.AddBuff(0,99,3425,1,2)
	else						--��3D�ϰ����ɴ������̨λ��
		cPlayer.Stop()
		--cPlayer.TurnTo(cNpc.nFaceDirection)
		cPlayer.TurnToCharacter(cNpc.dwID)
		cPlayer.SetPosition(cNpc.nX, cNpc.nY, cNpc.nZ)
		--cPlayer.TurnTo(cNpc.nFaceDirection)
		cPlayer.TurnToCharacter(cNpc.dwID)
		cPlayer.SetTimer(16, "scripts/skill/����/����_�Ӽ���.lua", cNpc.dwID, 0)
		--cPlayer.CastSkill(3398,1)
		cPlayer.AddBuff(0,99,3425,1,2)	
	end


end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)				-- һ��ʱ�����Ч
	local npc = GetNpc(nParam1)
	if npc then
		player.TurnTo(npc.nFaceDirection)
		player.CastSkill(3398,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
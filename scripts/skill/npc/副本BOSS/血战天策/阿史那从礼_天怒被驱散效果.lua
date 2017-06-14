---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/��ʷ�Ǵ���_��ŭ����ɢЧ��.lua
-- ����ʱ��:	2013/11/4 17:36:40
-- �����û�:	mengxiangfei
-- �ű�˵��:	
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/��ʷ�Ǵ���_��ŭ����ɢЧ��.lua
-- ����ʱ��:	2013/9/4 11:20:07
-- �����û�:	mengxiangfei
-- �ű�˵��:	

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
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- ��������ģʽ
   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
   		nAttributeValue1,											-- ����ֵ1
   		nAttributeValue2											-- ����ֵ2
   		);
    --]]
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	
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
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
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
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	--skill.nMaxRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	--skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
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
	skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--print("��ŭ��ɢ�ű�")
	local nPlayer = GetPlayer(nCharacterID)
	if not nPlayer then
		return
	end
	
	local scene = nPlayer.GetScene()
	if not scene then
		return
	end

	--�ڰ�ʷ�Ǵ��������ֽ׶κ󣬲��ٽ��д�Ⱦ
	local ASNCL = scene.GetNpcByNickName("ashinacongli")
	if (ASNCL and ASNCL.bFightState ~= true) or not ASNCL then
		return
	end
	if ASNCL and ASNCL.nMoveState ~= MOVE_STATE.ON_DEATH then
		local npoint = ASNCL.GetCustomInteger4(28)
		if npoint == 1 then
			return
		end
	end
	
	local biaojiquan = scene.GetNpcByNickName("biaojiquan1")
	local FANWEI_zongkong = scene.GetNpcByNickName("fanwei_zongkong")
	local nbuffcount = 1
	if FANWEI_zongkong then
		nbuffcount = FANWEI_zongkong.GetCustomInteger4(24)
	end
	
	--CD���޷���ɢ
	if nPlayer.GetBuff(7081, 1) and nPlayer.bFightState == true then
		for i = 1, nbuffcount do
			nPlayer.AddBuff(0, 99, BuffID, nBuffLevel)
		end
		nPlayer.AddBuff(0, 99, 7081, 1)
		return
	end

	local playerlist = scene.GetAllPlayer()
	local newtable = {}
	
	if scene.dwMapID == 175 then
		if not biaojiquan then
			if #playerlist ~= 0 then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH and playertarget.bFightState == true and playertarget.dwID ~= nPlayer.dwID and not playertarget.GetBuff(6575, 1) then
						local nindex = #newtable + 1
						local distance = GetCharacterDistance(nPlayer.dwID, playertarget.dwID)
						newtable[nindex] = {}
						newtable[nindex].nX = distance
						newtable[nindex].nY = playertarget
					end
				end
			end
			
			if #newtable ~= 0 then
				--[[
				local k
				local m
				for i = 1, #newtable do
					for j = i + 1, #newtable do
						if newtable[i].nX > newtable[j].nX then
							k = newtable[i].nX
							m = newtable[i].nY
							newtable[i].nX = newtable[j].nX
							newtable[i].nY = newtable[j].nY
							newtable[j].nX = k
							newtable[j].nY = m
						end
					end
				end
				--]]
				local nNum = 0
				if nbuffcount >= 5 then
					nNum = 1
				else
					nNum = nbuffcount + 1
				end
				
				if FANWEI_zongkong then
					FANWEI_zongkong.SetCustomInteger4(24, nNum)
				end
				
				local nindex = Random(1, #newtable)
				for i = 1, nNum do
					newtable[nindex].nY.AddBuff(0, 99, BuffID, nBuffLevel)
				end
				newtable[nindex].nY.AddBuff(0, 99, 7081, 1)
			end
		else
			if #playerlist ~= 0 then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH and playertarget.bFightState == true and playertarget.dwID ~= nPlayer.dwID and not playertarget.GetBuff(6575, 1) then
						local nindex = #newtable + 1
						local distance = GetCharacterDistance(biaojiquan.dwID, playertarget.dwID)
						newtable[nindex] = {}
						newtable[nindex].nX = distance
						newtable[nindex].nY = playertarget
					end
				end
			end
			
			if #newtable ~= 0 then
				local k
				local m
				for i = 1, #newtable do
					for j = i + 1, #newtable do
						if newtable[i].nX > newtable[j].nX then
							k = newtable[i].nX
							m = newtable[i].nY
							newtable[i].nX = newtable[j].nX
							newtable[i].nY = newtable[j].nY
							newtable[j].nX = k
							newtable[j].nY = m
						end
					end
				end
				
				local nNum = 0
				if nbuffcount >= 5 then
					nNum = 1
				else
					nNum = nbuffcount + 1
				end
				
				if FANWEI_zongkong then
					FANWEI_zongkong.SetCustomInteger4(24, nNum)
				end
				
				if nLeftFrame == 0 then
					local nindex = Random(1, #newtable)
					for i = 1, nNum do
						newtable[nindex].nY.AddBuff(0, 99, BuffID, nBuffLevel)
					end
					newtable[nindex].nY.AddBuff(0, 99, 7081, 1)
				else	
					for i = 1, nNum do
						newtable[1].nY.AddBuff(0, 99, BuffID, nBuffLevel)
					end
					newtable[1].nY.AddBuff(0, 99, 7081, 1)
				end
			end
		end
	else
		if nPlayer and nPlayer.nMoveState == MOVE_STATE.ON_DEATH and ASNCL and ASNCL.nMoveState ~= MOVE_STATE.ON_DEATH then
			ASNCL.AddBuff(0, 99, 7147, 1)
		end
		if #playerlist ~= 0 then
			for i = 1, #playerlist do
				local playertarget = GetPlayer(playerlist[i])
				if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH and playertarget.bFightState == true and playertarget.dwID ~= nPlayer.dwID and not playertarget.GetBuff(6575, 1) then
					local nindex = #newtable + 1
					local distance = GetCharacterDistance(nPlayer.dwID, playertarget.dwID)
					newtable[nindex] = {}
					newtable[nindex].nX = distance
					newtable[nindex].nY = playertarget
				end
			end
		end
			
		if #newtable ~= 0 then
			local k
			local m
			for i = 1, #newtable do
				for j = i + 1, #newtable do
					if newtable[i].nX > newtable[j].nX then
						k = newtable[i].nX
						m = newtable[i].nY
						newtable[i].nX = newtable[j].nX
						newtable[i].nY = newtable[j].nY
						newtable[j].nX = k
						newtable[j].nY = m
					end
				end
			end
			local nNum = 0
			if nbuffcount >= 8 then
				nNum = 1
			else
				nNum = nbuffcount + 1
			end
			
			if FANWEI_zongkong then
				FANWEI_zongkong.SetCustomInteger4(24, nNum)
			end
			
			if nLeftFrame == 0 then
				local nindex = Random(1, #newtable)
				for i = 1, nNum do
					newtable[nindex].nY.AddBuff(0, 99, BuffID, nBuffLevel)
				end
				newtable[nindex].nY.AddBuff(0, 99, 7081, 1)
			else
				if (ASNCL and ASNCL.bFightState ~= true) or not ASNCL then
					return
				end
				if not nPlayer.GetBuff(6575,1) then
					nPlayer.CastSkill(8527, 1)
				end
				for i = 1, nNum do
					newtable[1].nY.AddBuff(0, 99, BuffID, nBuffLevel)
				end
				newtable[1].nY.AddBuff(0, 99, 7081, 1)
			end
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
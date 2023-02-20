-- //////////////////////////////////////////////////////////////////////
-- 카일룸 사크라 보스 2차_분신 소환되기전 몬스터_ID-2470 AI 117.Lua  ver.090113
-- //////////////////////////////////////////////////////////////////////



-- //////////////////////////////////////////////////////////////////////

Mob = LuaMob(CMob)

-- //////////////////////////////////////////////////////////////////
-- 사용자 변수는 여기에 선언합니다.

dwNextCreateTime = 0
bMobSay	= 0
bMobCreate = 0

-- //////////////////////////////////////////////////////////////////
-- 사용자 함수는 여기에 선언합니다.



-- //////////////////////////////////////////////////////////////////
function Init()

end

-- //////////////////////////////////////////////////////////////////
function OnAttacked( dwTime, dwCharID )

end

-- //////////////////////////////////////////////////////////////////
function OnAttackable( dwTime, dwCharID )

end

-- //////////////////////////////////////////////////////////////////
function OnNormalReset( dwTime )

end

-- //////////////////////////////////////////////////////////////////
function OnDeath( dwTime, dwAttackedCount )

end

-- //////////////////////////////////////////////////////////////////
function OnReturnHome( dwTime, dwAttackedCount )

end

-- //////////////////////////////////////////////////////////////////
function OnMoveEnd( dwTime )

end

--   //////////////////////////////////////////////////////////////////
function WhileCombat( dwTime, dwHPPercent, dwAttackedCount )

-- 체력이 50% 가 될때 메세지를 출력 후 1초뒤 몬스터 소환
	if ( dwHPPercent <= 50 ) then
		if ( bMobSay == 0 ) then
		-- 몬스터 생성시간은 메세지 출력 1초 후
		dwNextCreateTime = dwTime + 1000
		-- 메세지 출력
		Mob:LuaSayByIndex ( 6403, 200.0 )
		bMobSay = bMobSay + 1
		end
		if ( dwTime >= dwNextCreateTime ) and ( bMobCreate == 0 ) then
		-- 몬스터 생성 2마리 소환
		dwMobUID1 = Mob:LuaCreateMob ( 2472, 1, 0.0, 0.0 )
		-- 임시처방(몹유니크ID를 받아서 유니크ID가 없다면 더 재시도한다.
		if ( dwMobUID1 == 0 ) then
			dwMobUID2 = Mob:LuaCreateMob ( 2472, 1, 0.0, 0.0 )
			if ( dwMobUID2 == 0 ) then
				Mob:LuaCreateMob ( 2472, 1, 0.0, 0.0 )				
			end		
		end

		Mob:LuaCreateMob ( 2473, 2, 0.0, 0.0 )

		bMobCreate = bMobCreate + 1
		end
		if ( bMobCreate >= 1 ) then
			Mob:LuaDeleteMob ( 2470, 0, 0.0, 0.0, 500.0)
		end
	end
end

